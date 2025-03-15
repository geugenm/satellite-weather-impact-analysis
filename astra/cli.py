import importlib
import os
import typer
from pathlib import Path
from typing import Optional
from importlib.metadata import version, PackageNotFoundError

import astra.analyzer
import astra.influxdb.push
import astra.fetch.satnogs_dashboard.main

app = typer.Typer(help="Satellite Weather Impact Analysis Tool")

app.add_typer(
    astra.analyzer.app, name="analyze", help="Analyze in-database satellites"
)

app.add_typer(
    astra.influxdb.push.app, name="push", help="Push fetched data to influx db"
)

app.add_typer(
    astra.fetch.satnogs_dashboard.main.app,
    name="download",
    help="Download data from satnogs dashboard for satellite",
)


# Path to your commands directory
commands_dir = Path(__file__) / "fetch/sun"

# Dynamically import and add all command modules
for file in os.listdir(commands_dir):
    if file.endswith(".py") and not file.startswith("_"):
        module_name = file[:-3]  # Remove .py extension
        module = importlib.import_module(
            f".commands.{module_name}", package=__package__
        )

        # If the module has a Typer app, add it as a subcommand
        if hasattr(module, "app"):
            app.add_typer(module.app, name=module_name)


def get_version() -> str:
    try:
        return version("astra")
    except PackageNotFoundError:
        return "dev"


def version_callback(value: bool):
    if value:
        typer.echo(f"astra cli v{get_version()}")
        raise typer.Exit()


@app.callback()
def main(
    version: Optional[bool] = typer.Option(
        None,
        "--version",
        "-v",
        callback=version_callback,
        is_eager=True,  # This makes the version check happen before any command
        help="Show the application version and exit.",
    ),
):
    """
    Analyze satellite telemetry data and correlate with weather conditions.
    """
    pass  # The version callback handles the version display


if __name__ == "__main__":
    app()
