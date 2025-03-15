import typer
from typing import Optional
from importlib.metadata import version, PackageNotFoundError

app = typer.Typer(help="Satellite Weather Impact Analysis Tool")


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


@app.command()
def fetch(
    url: str = typer.Argument(..., help="SatNOGS dashboard URL"),
    satellite_name: str = typer.Argument(..., help="Satellite name"),
    time_from: str = typer.Option("-2y", "--from", help="Start time"),
    time_to: str = typer.Option("now", "--to", help="End time"),
):
    """Fetch satellite telemetry data."""
    typer.echo(f"Fetching data for {satellite_name} from {url}")
    # Your implementation here


@app.command()
def analyze(
    input_file: str = typer.Argument(..., help="Input data file"),
    output_file: str = typer.Option(None, "--output", "-o", help="Output file"),
):
    """Analyze satellite data."""
    typer.echo(f"Analyzing {input_file}")
    # Your implementation here


if __name__ == "__main__":
    app()
