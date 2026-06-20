#!/usr/bin/env bash
set -euo pipefail

# Extract pages from the newest PDF in doc-engine/build/latex.
#
# Usage:
#   ./doc-engine/scripts/extract-latest-training-pdf.sh <pages> <output.pdf>
#
# Examples:
#   ./doc-engine/scripts/extract-latest-training-pdf.sh 25-28 ~/Downloads/einheit-25-28.pdf
#   ./doc-engine/scripts/extract-latest-training-pdf.sh 27 ~/Downloads/einheit-seite-27.pdf

usage() {
  echo "Usage: $0 <pages> <output.pdf>"
  echo "  <pages> supports single pages, ranges, and comma lists (e.g. 3,5,8-10)."
}

if [[ $# -ne 2 ]]; then
  usage
  exit 1
fi

PAGES_SPEC="$1"
OUTPUT_PDF="$2"

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
LATEX_DIR="$REPO_ROOT/doc-engine/build/latex"
EXTRACT_SCRIPT="$REPO_ROOT/doc-engine/scripts/extract-pdf-pages.sh"

if [[ ! -x "$EXTRACT_SCRIPT" ]]; then
  echo "Error: helper script not executable: $EXTRACT_SCRIPT" >&2
  echo "Run: chmod +x doc-engine/scripts/extract-pdf-pages.sh" >&2
  exit 1
fi

if [[ ! -d "$LATEX_DIR" ]]; then
  echo "Error: LaTeX build directory not found: $LATEX_DIR" >&2
  echo "Run: make -C doc-engine latexpdf" >&2
  exit 1
fi

LATEST_PDF="$(find "$LATEX_DIR" -maxdepth 1 -type f -name '*.pdf' -printf '%T@ %p\n' | sort -nr | head -n1 | cut -d' ' -f2-)"

if [[ -z "$LATEST_PDF" ]]; then
  echo "Error: no PDF found in $LATEX_DIR" >&2
  echo "Run: make -C doc-engine latexpdf" >&2
  exit 1
fi

"$EXTRACT_SCRIPT" "$LATEST_PDF" "$PAGES_SPEC" "$OUTPUT_PDF"
