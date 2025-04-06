import typer
from pathlib import Path

app = typer.Typer(help="Get available satellites")


def get_satellites_map():
    """Read satellites.txt and return a mapping of satellite names to URLs."""
    satellites_file = Path(__file__).parent / "satellites.txt"
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


@app.callback(invoke_without_command=True)
def list_satellites():
    satellites_map = get_satellites_map()

    if not satellites_map:
        typer.echo("no satellites found")
        return

    typer.echo("available satellites:")
    for name in sorted(satellites_map.keys()):
        typer.echo(f"  {name}")


if __name__ == "__main__":
    app()
