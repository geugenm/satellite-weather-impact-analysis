import logging
from datetime import datetime
from glouton.domain.parameters.programCmd import ProgramCmd
from glouton.services.observation.observationsService import ObservationsService


def main():
    # Setup logging
    timestamp = datetime.now().strftime("%Y-%m-%d_%H-%M-%S")
    logging.basicConfig(filename=f'../logs/app_{timestamp}.log', filemode='w',
                        format='%(name)s - %(levelname)s - %(message)s')

    # Define NORAD ID and date range
    norad_id: int = 40379
    start_date: datetime = datetime.strptime("2019-01-01", "%Y-%m-%d")
    end_date: datetime = datetime.strptime("2019-01-02", "%Y-%m-%d")

    # Define additional arguments for ProgramCmd
    archives = None
    archive_modules = None
    archive_end_modules = None
    demoddata_end_modules = None
    waterfall_end_modules = None
    frame_end_modules = None
    waterfall_modules = None
    frame_modules = None

    # Create a Glouton configuration
    glouton_config = ProgramCmd(norad_id=norad_id,
                                ground_station_id=None,
                                start_date=start_date,
                                end_date=end_date,
                                observation_status=None,
                                working_dir=".tmp/",
                                waterfalls=False,
                                demoddata=True,
                                demoddata_modules=["CSV",
                                                   "ObsMetadataToJsonFile",
                                                   "Polaris",
                                                   "FlagNoImageNexusFrame"],
                                archives=archives,
                                archive_modules=archive_modules,
                                archive_end_modules=archive_end_modules,
                                demoddata_end_modules=demoddata_end_modules,
                                waterfall_end_modules=waterfall_end_modules,
                                waterfall_modules=waterfall_modules,
                                frame_end_modules=frame_end_modules,
                                frame_modules=frame_modules,
                                user=None,
                                transmitter_uuid=None,
                                transmitter_mode=None,
                                transmitter_type=None,
                                observer=None,
                                app_source=None,
                                transmitter=None)

    # Log the start of data extraction
    logging.info('Starting data extraction...')

    # Try to extract observations
    try:
        obs = ObservationsService(glouton_config)
        obs.extract()
    except Exception as eee:
        # Log any exceptions that occur
        logging.error("Data collection: %s", str(eee))
    else:
        # Log successful completion if no exceptions were raised
        logging.info('Data extraction completed successfully.')

    # Close all handlers
    for handler in logging.root.handlers[:]:
        handler.close()
        logging.root.removeHandler(handler)


if __name__ == "__main__":
    main()
