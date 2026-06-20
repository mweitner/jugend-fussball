#!/usr/bin/env bash
set -euo pipefail

# Extract selected pages from a PDF using pdfseparate + pdfunite.
#
# Usage:
#   ./doc-engine/scripts/extract-pdf-pages.sh <input.pdf> <pages> <output.pdf>
#
# Examples:
#   ./doc-engine/scripts/extract-pdf-pages.sh doc-engine/build/latex/jugendfussballd-undc-jugend.pdf 25-28 ~/Downloads/einheit.pdf
#   ./doc-engine/scripts/extract-pdf-pages.sh doc-engine/build/latex/jugendfussballd-undc-jugend.pdf 27 ~/Downloads/seite-27.pdf
#   ./doc-engine/scripts/extract-pdf-pages.sh doc-engine/build/latex/jugendfussballd-undc-jugend.pdf 2,5,8-10 ~/Downloads/auszug.pdf

usage() {
  echo "Usage: $0 <input.pdf> <pages> <output.pdf>"
  echo "  <pages> supports single pages, ranges, and comma lists (e.g. 3,5,8-10)."
}

if [[ $# -ne 3 ]]; then
  usage
  exit 1
fi

INPUT_PDF="$1"
PAGES_SPEC="$2"
OUTPUT_PDF="$3"

if [[ ! -f "$INPUT_PDF" ]]; then
  echo "Error: input PDF not found: $INPUT_PDF" >&2
  exit 1
fi

if ! command -v pdfseparate >/dev/null 2>&1; then
  echo "Error: pdfseparate is required but not found in PATH." >&2
  echo "Install package: poppler-utils" >&2
  exit 1
fi

if ! command -v pdfunite >/dev/null 2>&1; then
  echo "Error: pdfunite is required but not found in PATH." >&2
  echo "Install package: poppler-utils" >&2
  exit 1
fi

TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

OUT_DIR="$(dirname "$OUTPUT_PDF")"
mkdir -p "$OUT_DIR"

# Convert page spec to a de-duplicated, sorted page list.
PAGES_FILE="$TMP_DIR/pages.txt"
: > "$PAGES_FILE"

IFS=',' read -r -a TOKENS <<< "$PAGES_SPEC"
for token in "${TOKENS[@]}"; do
  token="${token// /}"
  if [[ -z "$token" ]]; then
    continue
  fi

  if [[ "$token" =~ ^[0-9]+$ ]]; then
    echo "$token" >> "$PAGES_FILE"
    continue
  fi

  if [[ "$token" =~ ^([0-9]+)-([0-9]+)$ ]]; then
    start="${BASH_REMATCH[1]}"
    end="${BASH_REMATCH[2]}"
    if (( start > end )); then
      echo "Error: invalid range '$token' (start > end)." >&2
      exit 1
    fi
    for p in $(seq "$start" "$end"); do
      echo "$p" >> "$PAGES_FILE"
    done
    continue
  fi

  echo "Error: invalid page token '$token'." >&2
  echo "Allowed: single page (7), range (3-8), list (2,4,9-11)." >&2
  exit 1
done

if [[ ! -s "$PAGES_FILE" ]]; then
  echo "Error: no pages selected from spec '$PAGES_SPEC'." >&2
  exit 1
fi

sort -n -u "$PAGES_FILE" -o "$PAGES_FILE"

PDF_PARTS=()
while IFS= read -r page; do
  if (( page < 1 )); then
    echo "Error: page numbers must be >= 1 (got $page)." >&2
    exit 1
  fi

  part="$TMP_DIR/page-$page.pdf"
  pdfseparate -f "$page" -l "$page" "$INPUT_PDF" "$part"
  PDF_PARTS+=("$part")
done < "$PAGES_FILE"

pdfunite "${PDF_PARTS[@]}" "$OUTPUT_PDF"

echo "Created: $OUTPUT_PDF"
