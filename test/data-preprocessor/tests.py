import os
import unittest
from pathlib import Path

import pandas as pd

from scripts.data_preprocessor import clean_and_save_csv
from scripts.data_preprocessor import remove_units_and_rename
from scripts.data_preprocessor import state_convert_to_bool


class TestDropNans(unittest.TestCase):
    def setUp(self):
        self.test_file = Path('data/nan_and_time.csv')
        self.assert_output_file = Path('data/assert_nan_and_time.csv')

    def test_clean_and_save_csv(self):
        # Define variables
        test_file_path = str(self.test_file)
        output_file_path = str(self.assert_output_file)
        last_test_output_path = f"{output_file_path}_cleaned"

        # Call the function to clean and save the CSV
        clean_and_save_csv(test_file_path, last_test_output_path)

        # Read the output file and perform checks
        required_output = pd.read_csv(output_file_path)
        current_output = pd.read_csv(last_test_output_path)

        # Log and assert comparison
        self.assertTrue(required_output.equals(current_output),
                        f"Expected Output=[{required_output.to_string()}]\nActual Output=[{current_output.to_string()}]")

        # Remove the last test output file
        os.remove(last_test_output_path)


class TestUnitColumnProcessing(unittest.TestCase):
    def setUp(self):
        self.test_dataset_path = Path('data/unit_column.csv')
        self.reference_dataset_path = Path('data/assert_unit_column.csv')

    def test_processing_unit_columns(self):
        # Define variables
        input_dataset_path = str(self.test_dataset_path)
        reference_dataset_path = str(self.reference_dataset_path)
        processed_dataset_path = f"{reference_dataset_path}_processed"

        # Execute the unit column processing function
        remove_units_and_rename(input_dataset_path, processed_dataset_path)

        # Load the reference and processed datasets for comparison
        reference_dataset = pd.read_csv(reference_dataset_path)
        processed_dataset = pd.read_csv(processed_dataset_path)

        # Assert that the processed dataset matches the reference dataset
        self.assertTrue(reference_dataset.equals(processed_dataset),
                        f"Reference Dataset=[{reference_dataset.to_string()}]\nProcessed Dataset=[{processed_dataset.to_string()}]")

        # Clean up the processed dataset file after verification
        os.remove(processed_dataset_path)


class TestStateConversion(unittest.TestCase):
    def setUp(self):
        self.test_dataset_path = Path('data/two_states.csv')
        self.reference_dataset_path = Path('data/assert_two_states.csv')

    def test_conversion_to_boolean(self):
        # Define variables
        input_dataset_path = str(self.test_dataset_path)
        reference_dataset_path = str(self.reference_dataset_path)
        converted_dataset_path = f"{reference_dataset_path}_converted"

        # Execute the state conversion function
        state_convert_to_bool(input_dataset_path, converted_dataset_path)

        # Load the reference and converted datasets for comparison
        reference_dataset = pd.read_csv(reference_dataset_path)
        converted_dataset = pd.read_csv(converted_dataset_path)

        # Assert that the converted dataset matches the reference dataset
        self.assertTrue(reference_dataset.equals(converted_dataset),
                        f"Reference Dataset=[{reference_dataset.to_string()}]\nConverted Dataset=[{converted_dataset.to_string()}]")

        # Clean up the converted dataset file after verification
        os.remove(converted_dataset_path)


if __name__ == '__main__':
    unittest.main()
