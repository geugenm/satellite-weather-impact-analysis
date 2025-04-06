import logging
from pathlib import Path
import sys
from importlib.metadata import PackageNotFoundError, version
from typing import Optional

import typer

from astra.analyze import app as analyzer_app
from astra.fetch.satnogs.cli import app as satnogs_app
from astra.fetch.sun.cli import app as sun_app

logging.basicConfig(
    format="%(asctime)s [%(name)s] %(message)s",
    level=logging.INFO,
    datefmt="%H:%M:%S",
)

logging = logging.getLogger(__name__)

app = typer.Typer()

app.add_typer(
    analyzer_app, name="analyze", help="analyze satellite data from database"
)
app.add_typer(
    satnogs_app,
    name="satnogs-dashboard",
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


@app.command(
    "workflow", help="combine workflow operations in current directory"
)
def workflow(
    ctx: typer.Context,
    satellite_name: str,
    time_from: Optional[str] = typer.Option(
        None, "--from", help="Start of the time range"
    ),
    time_to: Optional[str] = typer.Option(
        None, "--to", help="End of the time range"
    ),
) -> None:
    from astra.fetch.sun.cli import main as sun_cmd
    from astra.fetch.satnogs.cli import scrap as satnogs_cmd
    from astra.analyze import analyze_time_series

    try:
        logging.info(f"workflow started for satellite '{satellite_name}'")

        ctx.invoke(sun_cmd, parallel=True)

        ctx.invoke(
            satnogs_cmd,
            url=satellite_name,
            time_from=time_from,
            time_to=time_to,
            output_dir=Path("."),
        )

        ctx.invoke(
            analyze_time_series,
            graph_name=satellite_name,
            data_dir=Path("."),
            parallel=True,
            use_mlflow=False,
        )

        logging.info(f"workflow completed for satellite '{satellite_name}'")
    except Exception as e:
        logging.error(
            f"workflow failed for satellite '{satellite_name}': '{str(e)}'"
        )
        raise


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
        logging.debug("debug mode enabled")


if __name__ == "__main__":
    try:
        app()
        sys.exit(0)
    except Exception as e:
        logging.error(f"main failed with error '{str(e)}'")
        sys.exit(1)
