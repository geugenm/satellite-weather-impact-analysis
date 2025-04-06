from typing import Optional
from urllib.parse import urlparse
import typer
from pathlib import Path

app = typer.Typer(help="Enterprise Grafana Scraper with Enhanced Time Handling")


def get_satellites_map():
    """Read satellites.txt and return a mapping of satellite names to URLs."""
    satellites_file = Path(__file__).parent / "info" / "satellites.txt"
    satellites_map = {}

    if not satellites_file.exists():
        typer.echo(f"error: satellites file not found at {satellites_file}")
        raise typer.Exit(code=1)

    for line in satellites_file.read_text().splitlines():
        line = line.strip()
        if not line or line.startswith("#"):
            continue

        # Extract satellite name from URL
        try:
            parts = line.split("/")
            satellite_name = parts[-1].split("?")[
                0
            ]  # Remove query parameters if present
            satellites_map[satellite_name.lower()] = line
        except IndexError:
            continue  # Skip malformed URLs

    return satellites_map


@app.command("list", help="List all available satellites. (aslo 'ls')")
@app.command("ls", hidden=True)
def list_satellites():
    """List all available satellites."""
    satellites_map = get_satellites_map()

    if not satellites_map:
        typer.echo("no satellites found")
        return

    typer.echo("available satellites:")
    for name in sorted(satellites_map.keys()):
        typer.echo(f"  {name}")


@app.command("download", help="Download satellites data from satnogs dashboard")
def main(
    ctx: typer.Context,
    url: str = typer.Argument(help="Dashboard URL or satellite name"),
    time_from: Optional[str] = typer.Option(
        None, "--from", help="Start of the time range"
    ),
    time_to: Optional[str] = typer.Option(
        None, "--to", help="End of the time range"
    ),
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

    run_grafana_fetch(actual_url, Path(satellite_name), time_from, time_to)


if __name__ == "__main__":
    app()
