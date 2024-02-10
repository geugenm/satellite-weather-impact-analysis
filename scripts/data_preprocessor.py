import logging
import os
import re
from typing import Union, List

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
                new_name = f"{col} {unit}"
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
        description = ' '.join(
            f'{value} is {key}' for key, value in word_map.items())
        df.rename(columns={col: f'{col} where {description}'}, inplace=True)

    # Save the processed DataFrame to a new CSV file
    df.to_csv(output_file, index=False)

    # Log confirmation that the DataFrame has been saved
    logging.debug(f"DataFrame saved to {output_file}")


def merge_by_time(input_csv_filenames: List[str], output_csv_filename):
    # Load the CSV files into pandas DataFrames
    dfs = [pd.read_csv(filename) for filename in input_csv_filenames]

    # Convert 'Time' column to datetime type if not already
    for df in dfs:
        df['Time'] = pd.to_datetime(df['Time'])

    # Merge the DataFrames on the 'Time' column
    merged_df = dfs[0]
    for df in dfs[1:]:
        merged_df = pd.merge(merged_df, df, on='Time', how='outer')

    # Save the merged DataFrame to a new CSV file
    merged_df.to_csv(output_csv_filename, index=False)


def remove_csv_files_containing_image(directory):
    # Get the list of all files in the directory
    files = os.listdir(directory)

    # Iterate over each file
    for file in files:
        # Check if the file is a CSV file and contains "Image" in its name
        if file.endswith('.csv') and 'Image' in file:
            # Construct the full path to the file
            file_path = os.path.join(directory, file)
            # Remove the file
            os.remove(file_path)


def find_and_rename_time_column(input_file, output_file):
    # Read the input CSV file into a DataFrame
    df = pd.read_csv(input_file)

    # Find columns with time-like data
    time_columns = df.select_dtypes(
        include=['datetime64', 'timedelta64']).columns

    # Check if 'Time' column is missing and a time-compatible column is found
    if 'Time' not in df.columns and len(time_columns) > 0:
        time_column = time_columns[0]  # Take the first time-compatible column
        df.rename(columns={time_column: 'Time'},
                  inplace=True)  # Rename to 'Time'
        try:
            df['Time'] = pd.to_datetime(
                df['Time']).dt.time  # Convert to time format
            print("Conversion to time format successful.")
        except ValueError:
            print(
                "Conversion to time format failed. Incompatible data found in the 'Time' column.")
    else:
        print("No suitable time-compatible column found.")

    # Write the modified DataFrame to the output CSV file
    df.to_csv(output_file, index=False)


def process_csvs_in_folder(root_directory: str) -> None:
    remove_csv_files_containing_image(root_directory)
    for dirpath, dirnames, filenames in os.walk(root_directory):
        for filename in filenames:
            if filename.endswith('.csv'):
                filepath = os.path.join(dirpath, filename)
                try:
                    find_and_rename_time_column(filepath, filepath)
                    clean_and_save_csv(filepath, filepath)
                    remove_units_and_rename(filepath, filepath)
                    state_convert_to_bool(filepath, filepath)
                except Exception as e:
                    logging.error(f"Error: {e}")


# Example usage:
process_csvs_in_folder('../data/')
