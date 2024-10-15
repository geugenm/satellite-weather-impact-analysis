"""Helpers
"""

import os
from pathlib import Path


def create_parent_directory(file_name):
    """Create parent directory for file if needed
    """
    directory = os.path.dirname(file_name)
    Path(directory).mkdir(parents=True, exist_ok=True)
