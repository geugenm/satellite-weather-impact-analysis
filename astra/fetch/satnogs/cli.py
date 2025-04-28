from typing import Optional
from urllib.parse import urlparse
import typer
from pathlib import Path
import logging

from astra.fetch.satnogs.info.cli import app as info_app
from astra.fetch.satnogs.info.cli import get_satellites

logging = logging.getLogger(__name__)

app = typer.Typer(help="Enterprise Grafana Scraper with Enhanced Time Handling")

app.add_typer(info_app, name="ls", help="Get list of available satellites")


@app.command(
    help="Download satellite data from satnogs dashboard. Use 'ls' for getting available sats",
    epilog="""
    Scrape data from Grafana dashboards with parallel processing.

    Note that not all sats might be supported due to information formatting. See https://dashboard.satnogs.org

    Examples:

      $ scrap https://dashboard.satnogs.org/d/abEVHMIIk/veronika?orgId=1&from=now-2y&to=now

      $ scrap --o output --from now-7d --to now-1h veronika

      $ scrap --no-headless veronika now-7d now  # Run with visible browser for debugging
    """,
    no_args_is_help=True,
)
def scrap(
    url: str = typer.Argument(
        help="Dashboard URL/satellite name in available list ('ls')",
    ),
    time_from: str = typer.Argument(help="Start of the time range"),
    time_to: str = typer.Argument(help="End of the time range"),
    output_dir: Optional[Path] = typer.Option(
        None, "-o", help="Output directory. Defaults to url satellite_name"
    ),
    headless: bool = typer.Option(
        True,
        "--headless/--no-headless",
        help="Run browser in headless mode (default: enabled)",
    ),
    force_resfresh_panels_list: bool = typer.Option(
        False,
        "--no-cache",
        help="Use cache for panel gathering (default: enabled)",
    ),
) -> None:
    satellite_name = ""

    actual_url: str = url
    if not url.startswith("http"):
        satellite_name = url.lower()

        satellites_map: dict[str, str] = get_satellites()
        if satellite_name not in satellites_map:
            typer.echo(
                f"error: satellite '{url}' not found. use 'ls' command to see available satellites"
            )
            raise typer.Exit(code=1)

        actual_url = satellites_map[satellite_name]
    else:
        satellite_name = urlparse(url).path.split("/")[-1]

    from astra.fetch.satnogs.dashboard import run_grafana_fetch

    satellite_name = output_dir if output_dir else satellite_name
    logging.debug(
        f"running grafana fetch, url='{actual_url}', output_dir='{satellite_name}' time_from='{time_from}', time_to='{time_to}', headless='{headless}', force_refresh_panels_list='{force_resfresh_panels_list}'"
    )
    run_grafana_fetch(
        actual_url,
        Path(satellite_name),
        time_from,
        time_to,
        use_headless_browser_mode=headless,
        force_refresh_panels_list=force_resfresh_panels_list,
    )


if __name__ == "__main__":
    app()
