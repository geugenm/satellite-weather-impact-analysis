from pathlib import Path
import requests
import pandas as pd
import logging
from concurrent.futures import ThreadPoolExecutor

logging.basicConfig(
    level=logging.INFO, format="%(asctime)s - %(levelname)s - %(message)s"
)
logger = logging.getLogger(__name__)

SOLAR_URLS = {
    "swpc_observed_ssn.json": "https://services.swpc.noaa.gov/json/solar-cycle/swpc_observed_ssn.json",
    "daily_total_sunspot_number.csv": "https://www.sidc.be/SILSO/INFO/sndtotcsv.php",
    "daily_hemispheric_sunspot_number.csv": "https://www.sidc.be/SILSO/INFO/sndhemcsv.php",
    "fluxtable.txt": "https://spaceweather.gc.ca/solar_flux_data/daily_flux_values/fluxtable.txt",
}


def _process_sunspot_data(content: bytes, output_file: Path) -> None:
    pd.read_csv(
        content,
        delimiter=";",
        usecols=range(7),
        header=None,
        names=[
            "year",
            "month",
            "day",
            "decimal_year",
            "SNvalue",
            "SNerror",
            "Nb_observations",
        ],
    ).assign(Time=lambda df: pd.to_datetime(df[["year", "month", "day"]])).drop(
        columns=["year", "month", "day", "decimal_year"]
    ).to_csv(
        output_file, index=False
    )


def _download_and_process(url: str, target_file: Path) -> None:
    try:
        response = requests.get(url, timeout=10)
        response.raise_for_status()

        if target_file.suffix == ".php":
            _process_sunspot_data(
                response.content, target_file.with_suffix(".csv")
            )
        elif target_file.name == "fluxtable.txt":
            lines = response.text.splitlines()
            target_file.write_text("\n".join(lines[:1] + lines[2:]))
        else:
            target_file.write_bytes(response.content)

        logger.info(f"processed: {target_file.name}")
    except Exception as e:
        logger.error(f"failed {url}: {e}")
        raise


def download_solar_data(
    target_dir: Path = Path("downloads/sun").absolute(),
) -> None:
    target_dir.mkdir(parents=True, exist_ok=True)
    logger.info(f"downloading solar data to {target_dir}")

    with ThreadPoolExecutor() as pool:
        list(
            pool.map(
                lambda x: _download_and_process(SOLAR_URLS[x], target_dir / x),
                SOLAR_URLS.keys(),
            )
        )


if __name__ == "__main__":
    try:
        download_solar_data()
    except Exception as e:
        logger.error(f"fatal error: {e}")
        exit(1)

    with ThreadPoolExecutor() as pool:
        pool.map(
            lambda x: _download_and_process(SOLAR_URLS[x], target_dir / x),
            SOLAR_URLS.keys(),
        )
