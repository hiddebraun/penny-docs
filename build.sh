#!/bin/bash
# Build script for MkDocs deployment

set -e

# Install uv if not already installed
if ! command -v uv &> /dev/null; then
    curl -LsSf https://astral.sh/uv/install.sh | sh
    export PATH="$HOME/.cargo/bin:$PATH"
fi

# Install dependencies
uv sync

# Build the documentation
uv run mkdocs build
