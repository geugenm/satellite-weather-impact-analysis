import logging
import os
import re
from typing import Union, NoReturn

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
    logging.debug(f"Input file type detected as [{type(input_file)}]")

    if isinstance(input_file, pd.DataFrame):
        df = input_file
    else:
        try:
            logging.debug(
                f"Attempting to read CSV file from path [{input_file}]")
            df = pd.read_csv(input_file)
            logging.debug(
                f"Successfully loaded DataFrame with shape [{df.shape}]")
        except FileNotFoundError as e:
            logging.error(f"File not found: {e}")
            return
        except Exception as e:
            logging.error(f"Unexpected error reading CSV: {e}")
            return

    # Define a pattern to match the degree symbol and any trailing whitespace
    unit_pattern = re.compile(r'[^\d\s]*\s*$', re.UNICODE)
    changes = {}

    for col in df.columns:
        if col != 'Time':
            try:
                logging.debug(f"Processing column [{col}]")
                # Extract the unit from the first cell of the column
                unit = unit_pattern.findall(str(df[col].iloc[0]))
                if unit:
                    unit = unit[0]
                    logging.debug(f"Unit detected for column [{col}]: [{unit}]")
                    # Replace the unit in all cells of the column
                    df[col] = df[col].str.replace(unit, '', regex=True)
                    new_name = f"{col} ({unit.strip()})"
                    changes[col] = new_name
                    logging.debug(f"Renaming column '{col}' to '{new_name}'")
            except Exception as e:
                logging.error(
                    f"Unexpected error processing column [{col}]: {e}")
                continue

    if changes:
        logging.debug(f"Applying renamed columns: [{changes}]")
        df.rename(columns=changes, inplace=True)

    try:
        logging.debug(f"Saving DataFrame to output file [{output_file}]")
        df.to_csv(f"{output_file}", index=False)
        logging.info(f"Data saved successfully to output file [{output_file}]")
    except Exception as e:
        logging.error(f"Unexpected error writing to CSV: {e}")


def state_convert_to_bool(input_file: str, output_file: str) -> NoReturn:
    # Setup logging
    logging.basicConfig(level=logging.DEBUG)

    try:
        # Read CSV file safely
        df = pd.read_csv(input_file)
    except Exception as error:
        logging.error(
            f"Unable to read input file '{input_file}'. Error: {error}")
        raise

    data_columns = df.columns[1:]

    for col in data_columns:
        word_map = {}
        counter = 0

        for cell in df[col]:
            words = re.split(r'\s+', cell)
            for word in words:
                if word not in word_map:
                    word_map[word] = counter
                    counter += 1

        # Check if the column has more than three unique words
        if counter <= 3:
            # Define function to replace words with integers
            def replace_words_with_integers(cell):
                words = re.split(r'\s+', cell)
                return ' '.join(
                    str(word_map[word]) for word in words if word in word_map)

            # Apply function to the column
            df[col] = df[col].apply(replace_words_with_integers)
            # Create a description for renaming the column
            description = ' '.join(
                f'{value} is {key}' for key, value in word_map.items())
            # Rename the column
            df.rename(columns={col: f'{col} where {description}'}, inplace=True)

    # Save the modified DataFrame to the output file
    try:
        df.to_csv(output_file, index=False)
        logging.debug(f"DataFrame saved to {output_file}")
    except Exception as error:
        logging.error(
            f"Failed to save DataFrame to '{output_file}'. Error: {error}")
        raise


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
                    clean_and_save_csv(filepath, filepath)
                    logging.info(f"clean_and_save_csv succeed")
                except Exception as e:
                    logging.error(f"clean_and_save_csv error: {e}")

                try:
                    remove_units_and_rename(filepath, filepath)
                    logging.info(f"remove_units_and_rename succeed")
                except Exception as e:
                    logging.error(f"remove_units_and_rename error: {e}")

                try:
                    state_convert_to_bool(filepath, filepath)
                    logging.info(f"state_convert_to_bool succeed")
                except Exception as e:
                    logging.error(f"state_convert_to_bool error: {e}")

                try:
                    find_and_rename_time_column(filepath, filepath)
                    logging.info(f"find_and_rename_time_column succeed")
                except Exception as e:
                    logging.error(f"find_and_rename_time_column error: {e}")


# Example usage:
process_csvs_in_folder('../data/')
