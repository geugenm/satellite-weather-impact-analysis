"""Module for propagating orbit from OMMs and TLEs
"""

import logging
from datetime import datetime
from math import pi

import pandas as pd
from astropy import units as u
from astropy.time import Time
from orbit_predictor.sources import get_predictor_from_tle_lines
from poliastro.bodies import Earth
from poliastro.constants import GM_earth
from poliastro.core import angles
from poliastro.twobody.orbit import Orbit

from vinvelivaanilai.storage.retrieve import get_nearest_from_df

LOGGER = logging.getLogger(__name__)
CH = logging.StreamHandler()
CH.setLevel(logging.DEBUG)
LOG_FORMAT = "%(asctime)s - %(name)s - %(levelname)s - %(message)s"
FORMATTER = logging.Formatter(LOG_FORMAT)
CH.setFormatter(FORMATTER)
LOGGER.addHandler(CH)


def get_orbit_from_df(data):
    """Gets orbit using poliastro from OMM data

    Args:
        data (dict): OMM data

    Returns:
        poliastro.twobody.orbit.Orbit: Orbit feched from data
    """
    mean_anamoly = (float(data["MEAN_ANOMALY"]) * u.degree).to(u.rad)

    if mean_anamoly > pi * u.rad:
        mean_anamoly -= 2 * pi * u.rad

    eccentricity = float(data["ECCENTRICITY"]) * u.one

    true_anomaly = (
        angles.E_to_nu(
            angles.M_to_E(mean_anamoly.value, eccentricity),
            eccentricity,
        )
        * u.rad
    )

    semi_major_axis = (
        pow(GM_earth, 1 / 3)
        / pow(2 * float(data["MEAN_MOTION"]) * pi / 86400, 2 / 3)
        * (u.s ** (2 / 3))
    )

    orbit = Orbit.from_classical(
        attractor=Earth,
        a=semi_major_axis,
        ecc=eccentricity,
        inc=float(data["INCLINATION"]) * u.degree,
        raan=float(data["RA_OF_ASC_NODE"]) * u.degree,
        argp=float(data["ARG_OF_PERICENTER"]) * u.degree,
        nu=true_anomaly,
        epoch=Time(data["EPOCH"]),
    )

    return orbit


def get_position_velocity_from_omm(epoch_time, omm_data):
    """Gets position and velocity at epoch_time

    Args:
        epoch_time (datetime.datetime): Time for which orbit has to be
            propogated
        omm_data (pd.DataFrame): OMM data

    Raises:
        TypeError: When epoch_time is not an instance of datetime
        TypeError: When omm_data is not an instance of pd.DataFrame

    Returns:
        pd.DataFrame: EPOCH time, position and velocity in ECEF coordinates
    """
    if not isinstance(epoch_time, datetime):
        raise TypeError(
            "Expected {} got {} for epoch_time".format(
                datetime, type(epoch_time)
            )
        )

    if not isinstance(omm_data, pd.DataFrame):
        raise TypeError(
            "Expected {} got {} for epoch_time".format(
                pd.DataFrame, type(omm_data)
            )
        )

    orbit = get_orbit_from_df(omm_data.iloc[0].to_dict())
    orbit_now = orbit.propagate(Time(epoch_time))
    rv_dict = {"t": epoch_time, "r": orbit_now.r, "v": orbit_now.v}

    return rv_dict


def get_position_velocity_from_tle(epoch_time, tle_data):
    """Gets position and velocity at epoch_time

    Args:
        epoch_time (datetime.datetime): Time for which orbit has to be
            propogated
        tle_data (dict/pd.series): TLE data with keys TLE_LINE0, TLE_LINE1

    Raises:
        TypeError: When epoch_time is not an instance of datetime class

    Returns:
        dict: EPOCH time, position and velocity in ECEF coordinates
    """
    if not isinstance(epoch_time, datetime):
        raise TypeError(
            "Expected {} got {} for epoch_time".format(
                datetime, type(epoch_time)
            )
        )

    LOGGER.info(
        "Propogating the orbit and calculating position and velocity at %s",
        datetime.isoformat(epoch_time),
    )

    tle_lines = (tle_data["TLE_LINE1"], tle_data["TLE_LINE2"])
    predictor = get_predictor_from_tle_lines(tle_lines)
    pred_rv = predictor.get_position(epoch_time)

    rv_dict = {
        "t": pred_rv.when_utc,
        "r": pred_rv.position_ecef * u.km,
        "v": pred_rv.velocity_ecef * (u.km / u.s),
    }

    return rv_dict


def get_position_velocity_multiple_from_tle(epoch_times, orbit_df):
    """Gets position and velocity at every epoch_time in epoch_times

    Args:
        epoch_times (list): Times for which orbit has to be propogated
        orbit_df (pd.DataFrame): DataFrame containing all TLEs (nearest one
        found automatically for every epoch_time)

    Raises:
        TypeError: When epoch_time is not a list
        TypeError: When orbit_df is not pd.DataFrame

    Returns:
        pd.DataFrame: EPOCH time, position and velocity in ECEF coordinates
    """
    if not isinstance(epoch_times, list):
        raise TypeError(
            "Expected {} got {} for epoch_times".format(
                list, type(epoch_times)
            )
        )

    if not isinstance(orbit_df, pd.DataFrame):
        raise TypeError(
            "Expected {} got {} for orbit_df".format(
                pd.DataFrame, type(orbit_df)
            )
        )

    orbit_df = orbit_df.loc[~orbit_df.index.duplicated(keep="first")]

    pv_multiple = []
    for epoch_time in epoch_times:
        pv_multiple.append(
            get_position_velocity_from_tle(
                epoch_time, get_nearest_from_df(epoch_time, orbit_df)
            )
        )

    return pd.DataFrame(pv_multiple).set_index("t")
