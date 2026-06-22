# Configuration file for the Sphinx documentation builder for jugend-fussball.
import os
import shutil
from datetime import datetime, timezone

version = os.popen("git -C . describe --tags --always --dirty").read().rstrip()

project = "Jugendfussball"
copyright = "2026, Michael Weitner"
author = "Michael Weitner"

release = version
build_date = datetime.now(timezone.utc).strftime("%Y-%m-%d")
build_meta = f"{build_date} · {release}"

extensions = [
    "sphinx.ext.autodoc",
    "sphinx.ext.imgconverter",
    "sphinx.ext.intersphinx",
    "sphinx.ext.todo",
    "sphinx.ext.viewcode",
    "myst_parser",
    "sphinxcontrib.plantuml",
    "sphinxcontrib.mermaid",
]

myst_heading_anchors = 6

source_suffix = {
    ".md": "markdown",
    ".rst": "restructuredtext",
}

templates_path = ["_templates"]

exclude_patterns = ["_build", "Thumbs.db", ".DS_Store"]

html_theme = "furo"
html_title = f"{project} ({build_meta})"
html_css_files = [
    "title-meta.css",
]
html_js_files = [
    "title-meta.js",
]
html_static_path = ["_static", "_static-content"]

# Prefer XeLaTeX for better Unicode support and avoid optional chapter style
# packages that may be missing on minimal TeX installations.
latex_engine = "xelatex"
latex_elements = {
    "fncychap": "",
    "fontpkg": r"""
\setmainfont{TeX Gyre Termes}
\setsansfont{TeX Gyre Heros}
\setmonofont{TeX Gyre Cursor}
""",
}

# Convert images unsupported by LaTeX (for example SVG) during PDF builds.
if shutil.which("magick"):
    image_converter = "magick"
    image_converter_args = ["convert"]
else:
    image_converter = "convert"

todo_include_todos = True
