import importlib.util
import inspect
from pathlib import Path
from typing import List, Type

from astra.fetch.sun.data_processor import DataProcessor


def import_module(file_path: Path):
    """Import a module from file path."""
    module_name = file_path.stem
    spec = importlib.util.spec_from_file_location(module_name, file_path)
    if spec is None or spec.loader is None:
        return None

    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def get_processor_classes(module) -> List[Type[DataProcessor]]:
    """Get all classes in the module that inherit from DataProcessor."""
    processor_classes = []

    for _, obj in inspect.getmembers(module):
        # Check if it's a class and inherits from DataProcessor
        if (
            inspect.isclass(obj)
            and issubclass(obj, DataProcessor)
            and obj != DataProcessor
        ):  # Exclude the base class itself
            processor_classes.append(obj)

    return processor_classes


def main():
    """Import all modules in current directory and run DataProcessor instances."""
    current_dir = Path(__file__).parent
    processor_count = 0

    # Get all Python files in the current directory
    python_files = [
        f
        for f in current_dir.glob("*.py")
        if f.is_file()
        and f.name != "__init__.py"
        and not f.name.startswith("_")
    ]

    logger.info(f"found {len(python_files)} python files in {current_dir}")

    # Import each module and find DataProcessor subclasses
    for file_path in python_files:
        try:
            module = import_module(file_path)
            if not module:
                continue

            processor_classes = get_processor_classes(module)

            for processor_class in processor_classes:
                try:
                    logger.info(
                        f"instantiating {processor_class.__name__} from {file_path.name}"
                    )
                    processor = processor_class()
                    logger.info(f"running {processor_class.__name__}")
                    processor.run()
                    processor_count += 1
                except Exception as e:
                    logger.error(
                        f"error running {processor_class.__name__}: {str(e)}"
                    )
        except Exception as e:
            logger.error(f"error importing {file_path.name}: {str(e)}")

    logger.info(f"successfully ran {processor_count} data processors")


if __name__ == "__main__":
    # Set up logging
    import logging

    logging.basicConfig(
        level=logging.INFO,
        format="%(asctime)s [%(name)s] %(message)s",
        datefmt="%Y-%m-%dT%H:%M:%S",
    )
    logger = logging.getLogger("processor_runner")

    main()
