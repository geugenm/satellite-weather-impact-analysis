import typer
import polars as pl
import logging
from pathlib import Path
from typing import Optional
import dateparser

logger = logging.getLogger(__name__)

app = typer.Typer()


@app.callback(invoke_without_command=True)
def main(
    input_file: Path = typer.Argument(..., help="CSV file to filter"),
    time_col: str = typer.Option("--t", help="Time column name"),
    from_date: str = typer.Option(
        None, "--from", help="Start date (e.g., 'now-5y')"
    ),
    to_date: str = typer.Option(None, "--to", help="End date (e.g., 'now-1y')"),
    output_file: Optional[Path] = typer.Option(
        None, "--out", "-o", help="Output file path"
    ),
):
    """Filter CSV by time range."""
    logger.info(f"'filter' started with params 'file': '{input_file}'")

    try:
        # Load data
        df = pl.read_csv(input_file, try_parse_dates=True)

        if time_col not in df.columns:
            logger.error(
                f"'filter' failed with error 'column not found': '{time_col}'"
            )
            raise typer.Exit(1)

        # Parse dates
        start_date = dateparser.parse(from_date) if from_date else None
        end_date = dateparser.parse(to_date) if to_date else None

        if (from_date and not start_date) or (to_date and not end_date):
            logger.error(
                f"'parse_dates' failed with params 'from': '{from_date}', 'to': '{to_date}'"
            )
            raise typer.Exit(1)

        logger.info(
            f"'filter_range' processing with 'from': '{start_date}', 'to': '{end_date}'"
        )

        # Apply filter
        rows_before = len(df)

        if start_date and end_date:
            df = df.filter(pl.col(time_col).is_between(start_date, end_date))
        elif start_date:
            df = df.filter(pl.col(time_col) >= start_date)
        elif end_date:
            df = df.filter(pl.col(time_col) <= end_date)

        # Write output
        out_file = output_file or input_file
        df.write_csv(out_file)

        logger.info(
            f"'filter' completed with 'removed': '{rows_before - len(df)}', 'kept': '{len(df)}'"
        )

    except Exception as e:
        logger.error(f"'filter' failed with 'error': '{str(e)}'")
        raise typer.Exit(1)


if __name__ == "__main__":
    app()
