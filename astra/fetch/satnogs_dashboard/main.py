import argparse
from pathlib import Path
import logging
import astra.fetch.satnogs_dashboard.format as format
import astra.fetch.satnogs_dashboard.scrap as scrap

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s [%(levelname).1s] %(message)s",
    datefmt="%Y-%m-%d %H:%M:%S",
)
logger = logging.getLogger(__name__)


def init_argparse() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        description="Download and process satellite data",
        formatter_class=argparse.RawDescriptionHelpFormatter,
    )
    parser.add_argument(
        "url",
        help="Grafana dashboard URL",
    )
    parser.add_argument(
        "--output",
        type=Path,
        help="output directory for processed files",
        default=Path("formatted"),
    )
    parser.add_argument(
        "--strict",
        action="store_true",
        help="enforce strict formatting rules",
    )
    return parser


def process_satellite(url: str, output_dir: Path, strict: bool = False):
    sat_name = url.split("/")[-1].split("?")[0]
    config_file = scrap.CONFIG_DIR / f"{sat_name}.yaml"

    if not config_file.exists():
        logging.info(f"no config found for '{sat_name}', scraping dashboard...")
        scrap.process_grafana_url(url, study_mode=True)
    else:
        logging.info(
            f"config found for '{sat_name}' in '{config_file}', skipping dashboard scrape"
        )

    scrap.process_config_file(config_file)

    satellites = [sat_name]
    format.process_satellites(satellites, output_dir, strict)


def main():
    parser = init_argparse()
    args = parser.parse_args()

    process_satellite(args.url, args.output, args.strict)


if __name__ == "__main__":
    main()
