# Configuration file for the Sphinx documentation builder for jugend-fussball.
import os

version = os.popen("git -C . describe --tags --always --dirty").read().rstrip()

project = "Jugendfussball"
copyright = "2026, Michael Weitner"
author = "Michael Weitner"

release = version

extensions = [
    "sphinx.ext.autodoc",
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
html_title = f"{project} ({release})"
html_static_path = ["_static"]

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

todo_include_todos = True
