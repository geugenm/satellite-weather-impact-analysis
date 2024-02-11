import unittest

import pandas as pd

from scripts.data_preprocessor import clean_and_save_csv
from scripts.data_preprocessor import remove_units_and_rename
from scripts.data_preprocessor import state_convert_to_bool


class TestCleanAndSaveCSV(unittest.TestCase):

    def setUp(self):
        self.test_file = 'drop_nan_test.csv'
        self.output_file = 'output_dropped_nan.csv'

    def test_clean_and_save_csv(self):
        # Call the function to clean and save the CSV
        clean_and_save_csv(self.test_file, self.output_file)

        # Read the output file and perform checks
        output_df = pd.read_csv(self.output_file)

        # Check that there are no rows with all NaN values in the data columns
        data_columns = output_df.columns[
                       1:]  # Assuming 'time' is the first column
        self.assertFalse((output_df[data_columns].isnull().all(axis=1)).any())


class TestRemoveUnitsAndRename(unittest.TestCase):
    def setUp(self):
        self.test_file = '123.csv'
        self.output_file = 'output_units_removed.csv'

    def test_remove_units_and_rename(self):
        # Call the function to remove units and rename
        remove_units_and_rename(self.test_file, self.output_file)

        # Read the output file and perform checks
        output_df = pd.read_csv(self.output_file)

        # Check that the units have been removed from the column names
        for col in output_df.columns:
            self.assertNotIn("V", col, "Column name still contains unit.")

        # Check that the units have been removed from the column values
        for col in output_df.columns:
            if col != 'time':  # Skip 'time' column
                self.assertFalse(
                    output_df[col].astype(str).str.contains("V").any(),
                    "Column values still contain unit.")


class TestStateConversion(unittest.TestCase):
    def setUp(self):
        self.test_file = 'state_conversion_test.csv'
        self.output_file = 'output_converted_state.csv'

    def test_state_convert_to_bool(self):
        # Call the function to clean and save the CSV
        state_convert_to_bool(self.test_file, self.output_file)

        # Read the output file and perform checks
        output_df = pd.read_csv(self.output_file)

        # Check that there are no rows with all NaN values in the data columns
        data_columns = output_df.columns[
                       1:]  # Assuming 'time' is the first column
        self.assertFalse((output_df[data_columns].isnull().all(axis=1)).any())


if __name__ == '__main__':
    unittest.main()
