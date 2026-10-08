# Post-render step for the book: a full book render clears docs/, so
# re-render the slide decks into docs/slides/ afterwards.
import os
import subprocess
from pathlib import Path

env = {k: v for k, v in os.environ.items() if not k.startswith("QUARTO_")}
subprocess.run(["quarto", "render"], cwd=Path(__file__).parent, env=env, check=True)
