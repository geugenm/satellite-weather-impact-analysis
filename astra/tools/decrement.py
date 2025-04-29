#!/usr/bin/env python3

import typer
import polars as pl
import logging
from pathlib import Path
from typing import Optional

# Setup logging
logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s [%(name)s][%(levelname)s] %(message)s",
    datefmt="%Y-%m-%d %H:%M:%S",
)
logger = logging.getLogger(Path(__file__).stem)

app = typer.Typer(add_completion=False)


@app.callback(invoke_without_command=True)
def main(
    input_file: Path = typer.Argument(
        ...,
        exists=True,
        file_okay=True,
        dir_okay=False,
        readable=True,
        help="Input CSV file with cumulative data.",
    ),
    time_col: str = typer.Option(
        ..., "--t", help="Name of the time column to preserve."
    ),
    output_file: Optional[Path] = typer.Option(
        None,
        "--out",
        "-o",
        help="Output file path. Overwrites input if not provided.",
    ),
    precision: int = typer.Option(
        8,
        "--precision",
        help="Number of decimal places to round the delta values to.",
    ),
):
    """
    Calculates the difference (delta) between consecutive rows for numeric columns,
    preserving a specified time column. Handles both integer and float data.
    """
    logger.info(f"starting deincrement process for '{input_file}'")
    try:
        # Read CSV, infer schema, treat empty strings as nulls
        df = pl.read_csv(input_file, try_parse_dates=True, null_values=[""])
        logger.info(f"loaded dataframe with shape: {df.shape}")
        logger.info(f"initial dtypes: {df.dtypes}")

        if time_col not in df.columns:
            logger.error(
                f"specified time column '{time_col}' not found in the dataframe"
            )
            raise typer.Exit(code=1)

        # Identify numeric columns to process (excluding the time column)
        numeric_cols = []
        for col_name, dtype in df.schema.items():
            if col_name != time_col and dtype.is_numeric():
                numeric_cols.append(col_name)
            elif col_name != time_col:
                logger.warning(
                    f"column '{col_name}' is not numeric ({dtype}), skipping"
                )

        if not numeric_cols:
            logger.error(
                "no numeric data columns found to process (excluding time column)"
            )
            raise typer.Exit(code=1)

        logger.info(
            f"identified numeric columns for deincrementing: {numeric_cols}"
        )

        # --- FIXED Core Logic ---
        expressions = []
        for col in numeric_cols:
            # Key fix: Round input values BEFORE calculating diff
            expr = (
                pl.col(col)
                .cast(pl.Float64)
                .round(precision)  # Round first for consistent values
                .diff()
                .fill_null(0.0)
                .round(precision)  # Round again for clean output
                .cast(pl.Float64)  # Ensure float type
                .alias(col)
            )
            expressions.append(expr)
        # --- End Core Logic ---

        # Apply all transformations
        df_result = df.with_columns(expressions)
        logger.info(
            f"applied deincrement logic. result shape: {df_result.shape}"
        )

        # Log a sample of the results for verification
        logger.info("sample of calculated deltas (first 5 rows):")
        logger.info(f"\n{df_result.head(5).select([time_col] + numeric_cols)}")

        # Determine output path
        out_path = output_file if output_file else input_file
        logger.info(f"writing result to '{out_path}'")

        # Write the result
        df_result.write_csv(out_path)

        logger.info("deincrement process completed successfully")

    except pl.exceptions.ColumnNotFoundError as e:
        logger.error(f"polars error: {e}")
        raise typer.Exit(code=1)
    except Exception as e:
        logger.exception(f"an unexpected error occurred: {e}")
        raise typer.Exit(code=1)


if __name__ == "__main__":
    app()
