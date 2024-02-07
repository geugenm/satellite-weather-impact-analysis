import logging
import os
import re

import pandas as pd

logging.basicConfig(level=logging.INFO,
                    format='%(asctime)s - %(levelname)s - %(message)s')


def process_csv_file(file_path):
    try:
        # Read CSV file into a DataFrame
        df = pd.read_csv(file_path)
        logging.info(f"Processing file: {file_path}")

        # Process each column (except the first time column)
        for col in df.columns[1:]:
            # Task 1: Rename column if it doesn't contain any words from its original name
            if not any(word.lower() in col.lower() for word in
                       re.findall(r'\w+', col)):
                new_col_name = "new_name"  # Modify this as per your requirement
                df.rename(columns={col: new_col_name}, inplace=True)
                logging.info(f"Renamed column '{col}' to '{new_col_name}'")

            # Task 2: Check if the column is a time/date column
            if 'time' in col.lower() or 'date' in col.lower():
                # Check if the data is convertible to time
                try:
                    df[col] = pd.to_datetime(df[col])
                    logging.info(f"Converted column '{col}' to datetime")
                except ValueError:
                    logging.warning(
                        f"Column '{col}' could not be converted to datetime")

            # Task 3: Extract unit from data column entries and move it to column name
            if col != 'time':  # Exclude time column
                unit_match = re.search(r'(\d+)\s*(\w+)', str(df[col].iloc[0]))
                if unit_match:
                    unit = unit_match.group(2)
                    new_col_name = f"{col}, {unit}"
                    df.rename(columns={col: new_col_name}, inplace=True)
                    logging.info(
                        f"Moved unit '{unit}' from data entries to column name '{new_col_name}'")

            # Task 4: Convert words to numbers
            if col != 'time':  # Exclude time column
                word_to_number = {'On': 1, 'OFF': 2,
                                  'Full': 3}  # Define mappings (modify as needed)
                df[col] = df[col].map(word_to_number).fillna(df[col])
                logging.info(f"Converted words to numbers in column '{col}'")

        # Write modified DataFrame back to CSV
        df.to_csv(file_path, index=False)
        logging.info(f"Modified data written to {file_path}")

    except Exception as e:
        logging.error(f"Error processing file {file_path}: {e}")


def process_csv_files_in_folder(folder_path):
    for root, dirs, files in os.walk(folder_path):
        for file in files:
            if file.endswith('.csv'):
                file_path = os.path.join(root, file)
                process_csv_file(file_path)


if __name__ == "__main__":
    data_folder = "../data"  # Modify this as per your folder structure
    process_csv_files_in_folder(data_folder)
