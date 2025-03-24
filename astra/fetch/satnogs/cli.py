from typing import Optional
import typer
from pathlib import Path

app = typer.Typer(help="Enterprise Grafana Scraper with Enhanced Time Handling")


@app.callback(invoke_without_command=True)
def main(
    url: str = typer.Argument(..., help="Dashboard URL"),
    output_dir: str = typer.Argument(..., help="Directory for processed CSVs"),
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
      grafana-scraper "https://dashboard.satnogs.org/d/abEVHMIIk/veronika"  ./output --from now-7d --to now-1h
    """
    from astra.fetch.satnogs.main import run_grafana_fetch

    run_grafana_fetch(url, Path(output_dir), time_from, time_to)


if __name__ == "__main__":
    app()
