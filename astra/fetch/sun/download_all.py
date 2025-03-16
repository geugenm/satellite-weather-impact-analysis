import importlib.util
import inspect
import asyncio
from pathlib import Path
from typing import List, Type, Optional
import typer
import logging
from rich.logging import RichHandler
from rich.console import Console

from astra.fetch.sun.data_processor import DataProcessor

app = typer.Typer(
    help="Run data processors in the current directory", no_args_is_help=True
)
console = Console()


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


async def run_processor(processor_class, file_path, logger):
    """Run a processor asynchronously."""
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
        False, "--parallel", "-p", help="Run processors in parallel"
    ),
    debug: bool = typer.Option(False, "--debug", help="Enable debug logging"),
):
    """
    Import all modules in the specified directory and run DataProcessor instances.
    """
    # Set up logging
    log_level = logging.DEBUG if debug else logging.INFO
    logging.basicConfig(
        level=log_level,
        format="%(message)s",
        handlers=[RichHandler(console=console, rich_tracebacks=True)],
    )
    logger = logging.getLogger("processor_runner")

    current_dir = Path(__file__).parent

    # Get all Python files in the current directory
    python_files = [
        f
        for f in current_dir.glob("*.py")
        if f.is_file()
        and f.name != "__init__.py"
        and not f.name.startswith("_")
    ]

    logger.info(f"found {len(python_files)} python files in {current_dir}")

    async def process_files():
        processor_count = 0
        tasks = []

        # Import each module and find DataProcessor subclasses
        for file_path in python_files:
            try:
                module = import_module(file_path)
                if not module:
                    continue

                processor_classes = get_processor_classes(module)

                for processor_class in processor_classes:
                    if parallel:
                        # Add to tasks for parallel execution
                        tasks.append(
                            run_processor(processor_class, file_path, logger)
                        )
                    else:
                        # Run sequentially
                        success = await run_processor(
                            processor_class, file_path, logger
                        )
                        if success:
                            processor_count += 1
            except Exception as e:
                logger.error(f"error importing {file_path.name}: {str(e)}")

        # If parallel, wait for all tasks to complete
        if parallel:
            results = await asyncio.gather(*tasks, return_exceptions=True)
            processor_count = sum(1 for r in results if r is True)

        logger.info(f"successfully ran {processor_count} data processors")

    # Run the async function
    asyncio.run(process_files())


if __name__ == "__main__":
    app()
