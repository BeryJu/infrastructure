uv sync
uv run ansible-galaxy collection install -r collections/requirements.yml --force
uv run ansible-galaxy role install -r collections/requirements.yml --force
