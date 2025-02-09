import argparse
import logging
import sys
from pathlib import Path

import astra.fetch.satnogs_dashboard.format as format
import astra.fetch.satnogs_dashboard.scrap as scrap

__version__ = "1.0.0"

LOG_FORMAT = "%(asctime)s [%(module)s] %(levelname).1s: %(message)s"
DATE_FORMAT = "%Y%m%d-%H%M%S"


def init_argparse() -> argparse.ArgumentParser:
    """Configure command-line interface with battle-tested argparse settings"""
    parser = argparse.ArgumentParser(
        description=__doc__,
        formatter_class=argparse.ArgumentDefaultsHelpFormatter,
        epilog=f"""Examples:
  %(prog)s https://grafana.satnogs.org/d/SATNOGS-1234
  %(prog)s https://network.satnogs.org/d/SATNOGS-5678 --output /var/lib/satdata \\
    --strict
""",
    )

    input_group = parser.add_argument_group("Input parameters")
    input_group.add_argument(
        "url",
        help="Grafana dashboard URL (e.g. https://grafana.satnogs.org/d/SATNOGS-<ID>)",
    )

    output_group = parser.add_argument_group("Output control")
    output_group.add_argument(
        "-o",
        "--output",
        type=Path,
        default=Path("formatted"),
        help="Output directory for processed files",
    )
    output_group.add_argument(
        "--strict", action="store_true", help="Enable strict validation mode"
    )

    dev_group = parser.add_argument_group("Developer options")
    dev_group.add_argument(
        "-v", "--verbose", action="store_true", help="Enable debug logging"
    )
    dev_group.add_argument(
        "--version", action="version", version=f"%(prog)s {__version__}"
    )

    return parser


def process_satellite(url: str, output_dir: Path, strict: bool = False) -> None:
    """Core processing pipeline with error containment"""
    try:
        sat_name = url.split("/")[-1].split("?")[0]
        config_file = scrap.CONFIG_DIR / f"{sat_name}.yaml"

        if not config_file.exists():
            logging.warning(
                "No config found for '%s' - initiating scrape", sat_name
            )
            scrap.process_grafana_url(url, study_mode=True)
        else:
            logging.info("Using existing config: %s", config_file)

        scrap.process_config_file(config_file)
        output_dir.mkdir(parents=True, exist_ok=True)
        format.process_satellites([sat_name], output_dir, strict)

    except Exception as e:
        logging.critical("Processing failure: %s", str(e))
        raise


def main() -> None:
    """Entry point with proper error handling"""
    parser = init_argparse()
    args = parser.parse_args()

    logging.basicConfig(
        level=logging.DEBUG if args.verbose else logging.INFO,
        format=LOG_FORMAT,
        datefmt=DATE_FORMAT,
        stream=sys.stdout,
    )

    process_satellite(args.url, args.output, args.strict)


if __name__ == "__main__":
    main()
