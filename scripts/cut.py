#!/usr/bin/env python3
import argparse
import csv
from datetime import datetime, timedelta
import re
import sys
from dateutil.parser import parse as parse_date


def parse_grafana_time(expr: str) -> datetime:
    now = datetime.now()
    if expr == "now":
        return now

    m = re.match(r"now-(\d+)([smhdwy])", expr)
    if not m:
        raise ValueError(f"invalid time format: {expr}")

    value, unit = int(m.group(1)), m.group(2)

    if unit == "s":
        return now - timedelta(seconds=value)
    if unit == "m":
        return now - timedelta(minutes=value)
    if unit == "h":
        return now - timedelta(hours=value)
    if unit == "d":
        return now - timedelta(days=value)
    if unit == "w":
        return now - timedelta(weeks=value)
    if unit == "y":
        return now - timedelta(days=365 * value)

    raise ValueError(f"unknown time unit: {unit}")


def main() -> int:
    # Parse arguments
    parser = argparse.ArgumentParser(description="filter csv by time range")
    parser.add_argument("csv_file", help="csv file to process")
    parser.add_argument("time_column", help="time column name")
    parser.add_argument("from_time", help="from time (e.g. now-2y)")
    parser.add_argument("to_time", help="to time (e.g. now)")
    parser.add_argument(
        "-v", "--verbose", action="store_true", help="verbose output"
    )
    args = parser.parse_args()

    # Parse time range
    try:
        from_dt = parse_grafana_time(args.from_time)
        to_dt = parse_grafana_time(args.to_time)
        if args.verbose:
            print(f"filtering rows between {from_dt} and {to_dt}")
    except ValueError as e:
        print(f"error: {e}", file=sys.stderr)
        return 1

    # Process CSV
    try:
        # Read CSV
        with open(args.csv_file, newline="") as f:
            reader = csv.DictReader(f)
            if (
                not reader.fieldnames
                or args.time_column not in reader.fieldnames
            ):
                print(
                    f"error: column '{args.time_column}' not found",
                    file=sys.stderr,
                )
                return 1

            rows = list(reader)
            fieldnames = reader.fieldnames

        if args.verbose:
            # Print first row's timestamp for diagnosis
            if rows:
                print(f"sample timestamp: {rows[0][args.time_column]}")

        # Filter rows by time
        filtered = []
        parse_errors = 0

        for row in rows:
            try:
                # Use dateutil.parser for more flexible date parsing
                dt = parse_date(row[args.time_column])
                if from_dt <= dt <= to_dt:
                    filtered.append(row)
            except (ValueError, KeyError):
                parse_errors += 1
                continue

        if args.verbose and parse_errors > 0:
            print(f"warning: failed to parse {parse_errors} timestamps")

        # Write filtered data
        with open(args.csv_file, "w", newline="") as f:
            writer = csv.DictWriter(f, fieldnames=fieldnames)
            writer.writeheader()
            writer.writerows(filtered)

        print(f"kept {len(filtered)}/{len(rows)} rows")
        return 0

    except FileNotFoundError:
        print(f"error: file '{args.csv_file}' not found", file=sys.stderr)
        return 1
    except Exception as e:
        print(f"error: {e}", file=sys.stderr)
        return 1


if __name__ == "__main__":
    sys.exit(main())
