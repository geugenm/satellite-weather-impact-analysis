import os
import re
import time
from pathlib import Path
from typing import Union, List

import typer
from rich.console import Console
from rich.progress import Progress, TextColumn, BarColumn, TaskProgressColumn

from astra.fetch.satnogs_dashboard.main import main

console = Console()
batch_app = typer.Typer(help="Batch process satellite dashboard data")


def extract_satellite_name(url: str) -> str:
    """Extract the satellite name from the dashboard URL."""
    match = re.search(r"/d/[A-Za-z0-9]+/([a-zA-Z0-9-]+)", url)
    return match.group(1) if match else "unknown"


def process_urls(
    urls: List[str],
    output_dir: Union[str, Path],
    time_from: str,
    time_to: str,
    delay: float = 1.0,
) -> None:
    """Process a list of satellite URLs."""
    output_path = Path(output_dir)
    output_path.mkdir(parents=True, exist_ok=True)

    with Progress(
        TextColumn("[bold blue]{task.description}"),
        BarColumn(),
        TaskProgressColumn(),
        console=console,
    ) as progress:
        task = progress.add_task("Processing satellites", total=len(urls))

        for i, url in enumerate(urls):
            sat_name = extract_satellite_name(url)
            progress.update(task, description=f"Processing {sat_name}")

            # Create satellite-specific output directory
            sat_output_dir = output_path / sat_name
            sat_output_dir.mkdir(parents=True, exist_ok=True)

            try:
                # Call the app directly with arguments
                main(
                    url,
                    str(sat_output_dir),
                    time_from,
                    time_to,
                )
                console.print(f"[green]✓ Success:[/green] {sat_name}")
            except Exception as e:
                console.print(f"[red]✗ Error processing {sat_name}:[/red] {e}")

            # Add a small delay between requests
            if i < len(urls) - 1:  # No need to delay after the last item
                time.sleep(delay)

            progress.update(task, advance=1)


@batch_app.callback(invoke_without_command=True)
def process(
    input_file: Path = typer.Argument(
        ...,
        exists=True,
        readable=True,
        help="File containing satellite URLs, one per line",
    ),
    output_dir: Path = typer.Option(
        Path("data"), "--output", "-o", help="Directory to store processed data"
    ),
    time_from: str = typer.Option(
        "-2y", "--from", "-f", help="Start time (e.g., -4y, -6m, -30d)"
    ),
    time_to: str = typer.Option(
        "now", "--to", "-t", help="End time (e.g., now, -1d)"
    ),
    delay: float = typer.Option(
        1.0, "--delay", "-d", help="Delay between requests in seconds"
    ),
) -> None:
    """
    Batch process satellite dashboard data from a list of URLs.

    Reads URLs from INPUT_FILE, extracts data for each satellite,
    and saves the results to OUTPUT_DIR.
    """
    try:
        with open(input_file, "r") as f:
            urls = [line.strip() for line in f if line.strip()]

        if not urls:
            console.print(
                "[yellow]Warning:[/yellow] No URLs found in the input file"
            )
            raise typer.Exit(1)

        console.print(f"Found [bold]{len(urls)}[/bold] satellites to process")
        process_urls(urls, output_dir, time_from, time_to, delay)

    except Exception as e:
        console.print(f"[red]Error:[/red] {e}")
        raise typer.Exit(1)


if __name__ == "__main__":
    batch_app()
