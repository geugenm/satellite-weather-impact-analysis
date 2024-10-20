import os
import subprocess

parent_directory = "../data/satellites"


def run_core_script(directory_name):
    print(f"Discovering {directory_name}...")

    command = ["python", "core.py", directory_name]

    try:
        subprocess.run(command, check=True)
        print(f"Successfully ran core.py with argument: {directory_name}")
    except subprocess.CalledProcessError as e:
        print(
            f"Error occurred while running core.py with argument: {directory_name}. Error: {e}"
        )


def main():
    for entry in os.listdir(parent_directory):
        full_path = os.path.join(parent_directory, entry)

        if os.path.isdir(full_path):
            run_core_script(entry)


if __name__ == "__main__":
    main()
