"""Module to store data
"""

import logging

import influxdb_client

from vinvelivaanilai.storage.common import IDB_BETA, find_org_id

LOGGER = logging.getLogger(__name__)
CH = logging.StreamHandler()
CH.setLevel(logging.DEBUG)
LOG_FORMAT = "%(asctime)s - %(name)s - %(levelname)s - %(message)s"
FORMATTER = logging.Formatter(LOG_FORMAT)
CH.setFormatter(FORMATTER)
LOGGER.addHandler(CH)


def dump_to_json(dataframe, path):
    """Dumps the dataframe to json

    Args:
        dataframe (pd.DataFrame) -- Pandas dataframe that needs to be dumped
        path (string) -- Path to storage (filename)
    """
    # Making a copy of the data and resetting the index
    local_df = dataframe
    local_df.reset_index(inplace=True)

    # Converting dataframe to json
    jsonified_dataframe = local_df.to_json()

    # Writing the data to the file
    with open(path, "w") as json_file:
        json_file.write(jsonified_dataframe)

    LOGGER.info("Finished dumping 💩")


def dump_to_influxdb(dataframe, measurement_name, bucket_name):
    """Dumps the dataframe to influxdb (2.0)

    Args:
        dataframe (pd.DataFrame): Pandas dataframe that needs to be dumped
        measurement_name (str): Name of the measurement
        bucket_name (str): Name of the bucket to dump data to
    """
    # Creating the client and write client
    client = influxdb_client.InfluxDBClient(
        url=IDB_BETA["host"],
        token=IDB_BETA["token"],
        org=IDB_BETA["org"],
        debug=False,
    )

    check_bucket_exists_and_create(client, bucket_name)

    write_client = client.write_api(
        write_options=influxdb_client.WriteOptions(
            batch_size=500,
            flush_interval=10_000,
            jitter_interval=2_000,
            retry_interval=5_000,
        )
    )

    LOGGER.info("Client created successfully")

    # Writing the data
    write_client.write(
        bucket_name,
        record=dataframe,
        data_frame_measurement_name=measurement_name,
    )

    # Housekeeping
    write_client.__del__()
    client.close()

    LOGGER.info("A dump a day keeps the maintainers away!")


def check_bucket_exists_and_create(client, bucket_name):
    """Checks if bucket exists and if the bucket doesn't exist, creates it

    Args:
        client (influxdb_client.client): Instance of influxdb_client
        bucket_name (str): Name of the bucket to test and create
    """
    org_id = find_org_id(client)

    bucket_client = client.buckets_api()
    bucket_resp = bucket_client.find_bucket_by_name(bucket_name)

    if bucket_resp is not None:
        # bucket_resp has data even if bucket does not exist
        if bucket_resp.name == bucket_name:
            LOGGER.info(
                "Bucket found with id %s and name %s",
                bucket_resp.id,
                bucket_resp.name,
            )
            return

    LOGGER.info(
        "No bucket found with name %s, creating a new bucket", bucket_name
    )

    response = bucket_client.create_bucket(
        bucket_name=bucket_name, org_id=org_id
    )

    LOGGER.info(
        "Bucket created with id %s and name %s", response.id, response.name
    )


def delete_existing_bucket(client, bucket_name):
    """Deletes bucket with name bucket_name

    Args:
        client (influxdb_client.client): Instance of influxdb_client
        bucket_name (str): Name of the bucket to delete
    """

    bucket_client = client.buckets_api()
    response = bucket_client.find_bucket_by_name(bucket_name)

    if response.name != bucket_name:
        LOGGER.info("No bucket found with name: %s!", bucket_name)
        return

    LOGGER.info(
        "Deleting bucket with id: %s and name: %s", response.id, bucket_name
    )
    bucket_client.delete_bucket(response.id)
