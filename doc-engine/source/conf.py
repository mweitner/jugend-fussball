# Configuration file for the Sphinx documentation builder for jugend-fussball.
import os

version = os.popen("git -C . describe --tags --always --dirty").read().rstrip()

project = "Jugend Fußball TSV Erbach"
copyright = "2026, TSV Erbach Jugendleitung"
author = "TSV Erbach Jugendleitung"

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

todo_include_todos = True
