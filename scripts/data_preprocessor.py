import logging
import os
import re
from typing import Union

import pandas as pd

# Configure logging to display debug messages on the console
logging.basicConfig(level=logging.DEBUG)


def clean_and_save_csv(input_file: str, output_file: str) -> None:
    # Load the CSV file into a DataFrame
    df = pd.read_csv(input_file)

    # Identify the data columns based on their position in the DataFrame
    data_columns = df.columns[1:]  # Assuming 'time' is the first column

    # Log the shape of the original DataFrame
    logging.debug(f"Original DataFrame shape: {df.shape}")

    # Drop rows where all data columns are NaN
    df = df.dropna(subset=data_columns, how='all')

    # Log the shape of the DataFrame after dropping rows
    logging.debug(f"DataFrame shape after dropping rows: {df.shape}")

    # Save the cleaned DataFrame to a new CSV file
    df.to_csv(output_file, index=False)

    # Log confirmation that the DataFrame has been saved
    logging.debug(f"DataFrame saved to {output_file}")


def remove_units_and_rename(input_file: Union[str, pd.DataFrame],
                            output_file: str) -> None:
    # If a DataFrame is passed instead of a file path, use it directly
    if isinstance(input_file, pd.DataFrame):
        df = input_file
    else:
        # Otherwise, load the CSV file into a DataFrame
        df = pd.read_csv(input_file)

    # Regular expression pattern to match units at the end of a value
    unit_pattern = re.compile(r'\s*(.*\s+)?([a-zA-Z]+)\s*$')

    # Dictionary to store new column names and values
    changes = {'names': {}, 'values': {}}

    # Iterate over columns
    for col in df.columns:
        if col != 'time':  # Skip 'time' column
            # Find units in column values
            matches = df[col].apply(lambda x: unit_pattern.match(str(x)))
            non_matches = matches[matches.isna()]

            # If all values have units, remove units and append to column name
            if len(non_matches) == 0:
                unit = matches.iloc[-1].group(2)
                new_name = f"{col}, {unit}"
                changes['names'][col] = new_name
                # Remove units from values
                df[col] = df[col].str.replace(unit, '', regex=True)

    # Rename columns with units
    if changes['names']:
        df.rename(columns=changes['names'], inplace=True)

    # Save the DataFrame with updated column names and values to a new CSV file
    df.to_csv(output_file, index=False)


def state_convert_to_bool(input_file: str, output_file: str) -> None:
    # Load the CSV file into a DataFrame
    df = pd.read_csv(input_file)

    # Identify the data columns based on their position in the DataFrame
    data_columns = df.columns[1:]  # Assuming 'time' is the first column

    # Process each data column
    for col in data_columns:
        # Initialize a dictionary to map unique words to integers
        word_map = {}
        # Initialize counters for unique words
        counter = 0

        # Iterate over each cell in the column
        for cell in df[col]:
            # Split the cell into words
            words = re.split(r'\s+', cell)

            # Map each unique word to a unique integer
            for word in words:
                if word not in word_map:
                    word_map[word] = counter
                    counter += 1

        if counter > 3:
            return

        # Function to replace words with their mapped integer
        def replace_words_with_integers(cell):
            words = re.split(r'\s+', cell)
            return ' '.join(
                str(word_map[word]) for word in words if word in word_map)

        # Apply the replacement function to the column
        df[col] = df[col].apply(replace_words_with_integers)

        # Rename the column to include the mapping
        description = ', '.join(
            f'{value} is {key}' for key, value in word_map.items())
        df.rename(columns={col: f'{col}, where {description}'}, inplace=True)

    # Save the processed DataFrame to a new CSV file
    df.to_csv(output_file, index=False)

    # Log confirmation that the DataFrame has been saved
    logging.debug(f"DataFrame saved to {output_file}")


def process_csvs_in_folder(root_directory: str) -> None:
    # Walk through the directory tree
    for dirpath, dirnames, filenames in os.walk(root_directory):
        # Iterate over each file in the current directory
        for filename in filenames:
            # Check if the file is a CSV file
            if filename.endswith('.csv'):
                # Construct the full file path
                filepath: str = os.path.join(dirpath, filename)
                try:
                    clean_and_save_csv(filepath, filepath)
                except Exception as e:
                    logging.error(f"Error: {e}")

                try:
                    remove_units_and_rename(filepath, filepath)
                except Exception as e:
                    logging.error(f"Error: {e}")

                try:
                    state_convert_to_bool(filepath, filepath)
                except Exception as e:
                    logging.error(f"Error: {e}")


# Example usage:
process_csvs_in_folder('../data/')
