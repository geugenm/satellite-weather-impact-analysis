from typing import Optional
from urllib.parse import urlparse
import typer
from pathlib import Path

from astra.fetch.satnogs.info.cli import app as info_app
from astra.fetch.satnogs.info.cli import get_satellites_map

app = typer.Typer(help="Enterprise Grafana Scraper with Enhanced Time Handling")

app.add_typer(info_app, name="ls", help="get list of available satellites")


@app.command(
    "download",
    help="Download satellite data from satnogs dashboard. Use 'ls' for getting available sats",
)
def main(
    ctx: typer.Context,
    url: str = typer.Argument(help="Dashboard URL or satellite name"),
    time_from: Optional[str] = typer.Option(
        None, "--from", help="Start of the time range"
    ),
    time_to: Optional[str] = typer.Option(
        None, "--to", help="End of the time range"
    ),
    output_dir: Path = typer.Option("", help="Output directory"),
):
    """
    Scrape data from Grafana dashboards with parallel processing.

    Examples:
      grafana-scraper "https://dashboard.satnogs.org/d/abEVHMIIk/veronika?orgId=1&from=now-2y&to=now" ./output
      grafana-scraper "veronika" ./output --from now-7d --to now-1h
    """
    if ctx.invoked_subcommand is not None:
        return

    satellite_name = ""

    # Determine if input is URL or satellite name
    actual_url = url
    if not url.startswith("http"):
        satellite_name = url.lower()

        satellites_map = get_satellites_map()
        if satellite_name not in satellites_map:
            typer.echo(
                f"error: satellite '{url}' not found. use 'list' command to see available satellites"
            )
            raise typer.Exit(code=1)

        actual_url = satellites_map[satellite_name]
    else:
        satellite_name = urlparse(url).path.split("/")[-1]

    from astra.fetch.satnogs.dashboard import run_grafana_fetch

    satellite_name = output_dir if output_dir != "" else satellite_name
    run_grafana_fetch(actual_url, Path(satellite_name), time_from, time_to)


if __name__ == "__main__":
    app()
