import argparse
import json
from argparse import ArgumentParser, Namespace


def replace_and_save_json(satellite_name: str) -> None:
    # Read the JSON file
    with open('./cfg/polaris.json', 'r') as file:
        data = json.load(file)

    # Replace the placeholder with the satellite name
    json_str = json.dumps(data, indent=4)
    json_str = json_str.replace('{satellite_name}', satellite_name)
    data = json.loads(json_str)

    # Save the modified JSON to a new file
    satellite_name = satellite_name.lower()

    new_filename: str = f'./cfg/{satellite_name}.json'
    with open(new_filename, 'w') as file:
        json.dump(data, file, indent=4)


if __name__ == "__main__":
    # Create the parser
    parser: ArgumentParser = argparse.ArgumentParser(
        description='Replace satellite name in JSON file and save.')

    # Add the arguments
    parser.add_argument('satellite_name', type=str,
                        help='The name of the satellite to replace in the JSON file')

    # Parse the arguments
    args: Namespace = parser.parse_args()

    # Call the function with the provided satellite name
    replace_and_save_json(args.satellite_name)
