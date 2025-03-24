import logging
import sys
from importlib.metadata import PackageNotFoundError, version
from typing import Optional

import typer

from astra.analyze import app as analyzer_app
from astra.fetch.satnogs.cli import app as satnogs_app
from astra.fetch.sun.cli import app as sun_app

logging.basicConfig(
    format="%(asctime)s [%(name)s] %(levelname)s operation '%(message)s'",
    level=logging.INFO,
    datefmt="%Y-%m-%d %H:%M:%S",
)

app = typer.Typer()

app.add_typer(
    analyzer_app, name="analyze", help="analyze satellite data from database"
)

app.add_typer(
    satnogs_app,
    name="fetch-satnogs",
    help="download satellite data from satnogs dashboard",
)

app.add_typer(sun_app, name="fetch-sun", help="download solar activity data")


def get_version() -> str:
    try:
        return version("astra")
    except PackageNotFoundError:
        return "dev"


def version_callback(value: bool):
    if value:
        print(f"astra {get_version()}")
        raise typer.Exit(0)


@app.callback()
def main(
    version: Optional[bool] = typer.Option(
        None,
        "--version",
        "-v",
        callback=version_callback,
        is_eager=True,
        help="show version and exit",
    ),
    debug: bool = typer.Option(
        False,
        "--debug",
        "-d",
        help="enable debug logging",
    ),
):
    if debug:
        logging.getLogger().setLevel(logging.DEBUG)
        logging.debug("debug logging mode enabled")


if __name__ == "__main__":
    try:
        app()
        sys.exit(0)
    except Exception as e:
        logging.error(f"'main' failed with params '{str(e)}': '1'")
        sys.exit(1)
