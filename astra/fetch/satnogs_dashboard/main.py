import argparse
import logging
from pathlib import Path

import astra.fetch.satnogs_dashboard.format as format
import astra.fetch.satnogs_dashboard.scrap as scrap

from astra.config.data import get_project_config, DataConfig


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

    dev_group = parser.add_argument_group("Developer options")
    dev_group.add_argument(
        "-v", "--verbose", action="store_true", help="Enable debug logging"
    )

    return parser


def process_satellite(url: str, output_dir: Path) -> None:
    """Core processing pipeline with error containment"""
    strict: bool = True

    try:
        sat_name = url.split("/")[-1].split("?")[0]
        config_file = scrap.CONFIG_DIR / f"{sat_name}.yaml"
        output_dir = output_dir / sat_name

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


if __name__ == "__main__":
    parser = init_argparse()
    args = parser.parse_args()

    config: DataConfig = get_project_config()

    process_satellite(args.url, config.fetch.base_dir)
