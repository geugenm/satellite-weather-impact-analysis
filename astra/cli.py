import logging
from importlib.metadata import PackageNotFoundError, version
from pathlib import Path
from typing import Optional
import typer

from typing_extensions import Annotated

from astra.fetch.sun.cli import app as sun_app
from astra.analyze import app as analyzer_app
from astra.fetch.satnogs.cli import app as satnogs_app
from astra.tools.filter import app as filter_app
from astra.tools.decrement import app as deincrement_app


logging.basicConfig(
    format="%(asctime)s [%(levelname)s] [%(name)s] %(message)s",
    level=logging.WARNING,
    datefmt="%H:%M:%S",
)

logger = logging.getLogger(__name__)

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
app.add_typer(filter_app, name="filter", help="filter dataframe by dates")
app.add_typer(deincrement_app, name="deincrement", help="deincrement data")


def get_version() -> str:
    try:
        return version("astra")
    except PackageNotFoundError:
        return "dev"


def version_callback(value: bool) -> None:
    if value:
        print(f"astra {get_version()}")


def set_log_level(verbose_level: int):
    """Set log level based on verbosity"""
    if verbose_level == 0:
        logging.getLogger().setLevel(logging.WARNING)
    elif verbose_level == 1:
        logging.getLogger().setLevel(logging.INFO)
    else:
        logging.getLogger().setLevel(logging.DEBUG)

    logger.debug(
        f"log level set to {logging.getLevelName(logging.getLogger().level)}"
    )


@app.command(
    "workflow", help="combine workflow operations in current directory"
)
def workflow(
    ctx: typer.Context,
    satellite_name: str,
    time_from: Annotated[
        Optional[str], typer.Option(help="Start of the time range")
    ] = None,
    time_to: Annotated[
        Optional[str], typer.Option(help="End of the time range")
    ] = None,
) -> None:
    # Lazy import workflow-specific modules to improve performance
    from astra.analyze import analyze_time_series
    from astra.fetch.satnogs.cli import scrap as satnogs_cmd
    from astra.fetch.sun.cli import main as sun_cmd

    try:
        logger.info(f"workflow started for satellite '{satellite_name}'")

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

        logger.info(f"workflow completed for satellite '{satellite_name}'")
    except Exception as e:
        logger.error(
            f"workflow failed for satellite '{satellite_name}': '{str(e)}'"
        )
        raise


@app.callback()
def main(
    version: Annotated[
        bool,
        typer.Option(
            "--version",
            callback=version_callback,
            is_eager=True,
            help="show version and exit",
        ),
    ] = False,
    verbose: Annotated[
        int,
        typer.Option(
            "--verbose",
            "-v",
            count=True,
            help="increase verbosity (-v: INFO, -vv: DEBUG)",
        ),
    ] = 0,
):
    set_log_level(verbose)


if __name__ == "__main__":
    try:
        app()
    except Exception as e:
        logger.exception(f"main failed with error '{str(e)}'")
