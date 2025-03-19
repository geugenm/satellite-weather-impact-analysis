#!/usr/bin/env python3
import typer
from typing import Optional
from importlib.metadata import version, PackageNotFoundError

from astra.analyzer import app as analyzer_app
from astra.fetch.satnogs_dashboard.main import app as satnogs_app
from astra.fetch.sun.download_all import app as sun_app

app = typer.Typer(help="satellite weather impact analysis tool")

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
        typer.echo(f"astra {get_version()}")
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
):
    """analyze satellite telemetry and correlate with weather conditions"""
    pass


if __name__ == "__main__":
    app()
