import importlib.util
import inspect
import asyncio
from pathlib import Path
from typing import List, Type
import typer
import logging

from astra.fetch.sun.data_processor import DataProcessor

app = typer.Typer(
    help="Run data processors in the current directory", no_args_is_help=True
)

logging = logging.getLogger(__name__)


def import_module(file_path: Path):
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
        if (
            inspect.isclass(obj)
            and issubclass(obj, DataProcessor)
            and obj != DataProcessor
        ):  # Exclude the base class itself
            processor_classes.append(obj)

    return processor_classes


async def run_processor(processor_class, file_path, logger):
    try:
        logger.info(
            f"instantiating {processor_class.__name__} from {file_path.name}"
        )
        processor = processor_class()
        logger.info(f"running {processor_class.__name__}")

        # Run in thread pool to avoid blocking
        loop = asyncio.get_running_loop()
        await loop.run_in_executor(None, processor.run)
        return True
    except Exception as e:
        logger.error(f"error running {processor_class.__name__}: {str(e)}")
        return False


@app.callback(invoke_without_command=True)
def main(
    parallel: bool = typer.Option(
        False, "--parallel", "-p", help="run processors in parallel"
    ),
):
    current_dir = Path(__file__).parent

    python_files = [
        f
        for f in current_dir.glob("*.py")
        if f.is_file()
        and f.name != "__init__.py"
        and not f.name.startswith("_")
    ]

    logging.info(f"found {len(python_files)} python files in {current_dir}")

    async def process_files():
        processor_count = 0
        tasks = []

        for file_path in python_files:
            try:
                module = import_module(file_path)
                if not module:
                    continue

                processor_classes = get_processor_classes(module)

                for processor_class in processor_classes:
                    if parallel:
                        tasks.append(
                            run_processor(processor_class, file_path, logging)
                        )
                    else:
                        success = await run_processor(
                            processor_class, file_path, logging
                        )
                        if success:
                            processor_count += 1
            except Exception as e:
                logging.error(f"error importing {file_path.name}: {str(e)}")

        if parallel:
            results = await asyncio.gather(*tasks, return_exceptions=True)
            processor_count = sum(1 for r in results if r is True)

        logging.info(f"successfully ran {processor_count} data processors")

    asyncio.run(process_files())


if __name__ == "__main__":
    app()
