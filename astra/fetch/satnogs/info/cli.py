import typer
import asyncio
import astra.fetch.satnogs.info.urls as satnogs

app = typer.Typer(help="Get available satellites")


def get_satellites(force=False) -> dict[str, str]:
    try:
        urls = asyncio.run(satnogs.get_satellite_urls(force_refresh=force))
        return {url.split("/")[-1].lower(): url for url in urls}
    except Exception as e:
        typer.echo(f"error: {e}")
        raise typer.Exit(code=1)


@app.callback(invoke_without_command=True)
def list_satellites(
    f: bool = typer.Option(False, "-f", help="Force cache refresh")
) -> None:
    satellites = get_satellites(force=f)

    if not satellites:
        typer.echo("no satellites found")
        return

    typer.echo(f"{len(satellites)} satellites available:")
    for name in sorted(satellites.keys()):
        typer.echo(f"  {name}")


@app.command()
def update(
    f: bool = typer.Option(False, "-f", help="Force cache refresh")
) -> None:
    typer.echo("🛰️ Fetching satellite data...")
    satellites = get_satellites(force=f)
    typer.echo(f"✅ Found {len(satellites)} satellites")


if __name__ == "__main__":
    app()
