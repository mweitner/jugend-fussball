#!/usr/bin/env bash
set -euo pipefail

# Render all PlantUML .txt diagrams found anywhere in source/ tree and
# publish PNG + SVG files into source/_static/diagrams preserving relative paths.
# This allows diagrams to be stored close to markdown (for context) but still
# rendered to a centralized location (for reusability and cross-referencing).
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SOURCE_ROOT="$ROOT_DIR/source"
OUTPUT_DIR="$ROOT_DIR/source/_static/diagrams"

if ! command -v plantuml >/dev/null 2>&1; then
  echo "Error: 'plantuml' command not found in PATH." >&2
  exit 1
fi

if [ ! -d "$SOURCE_ROOT" ]; then
  echo "Error: source directory not found: $SOURCE_ROOT" >&2
  exit 1
fi

mkdir -p "$OUTPUT_DIR"

count=0
skipped=0
failed=0

# Find all .txt files anywhere in source tree (recursively)
while IFS= read -r -d '' src; do
  # Compute relative path from source root
  rel_path="${src#"$SOURCE_ROOT"/}"

  # Skip files already in _static (avoid re-rendering output)
  if [[ "$rel_path" =~ ^_static/ ]]; then
    skipped=$((skipped + 1))
    continue
  fi

  rendered_any=0

  # Render both formats to allow markdown-level selection (.png or .svg).
  for fmt in png svg; do
    if ! plantuml "-t$fmt" "$src" 2>/dev/null; then
      echo "Warning: PlantUML failed for $rel_path ($fmt)" >&2
      failed=$((failed + 1))
      continue
    fi

    # Compute output path, preserving directory structure
    rel_out="${rel_path%.txt}.$fmt"
    dst="$OUTPUT_DIR/$rel_out"
    mkdir -p "$(dirname "$dst")"

    # Move rendered output to centralized location
    tmp_out="${src%.txt}.$fmt"
    if [ -f "$tmp_out" ]; then
      mv -f "$tmp_out" "$dst"
      echo "Rendered ($fmt): source/$rel_path -> _static/diagrams/$rel_out"
      rendered_any=1
    fi
  done

  if [ "$rendered_any" -eq 1 ]; then
    count=$((count + 1))
  fi
done < <(find "$SOURCE_ROOT" -type f -name '*.txt' -print0)

echo ""
echo "PlantUML diagram generation complete (PNG + SVG)."
echo "- Source root: $SOURCE_ROOT"
echo "- Output root: $OUTPUT_DIR"
echo "- Diagrams rendered: $count"
echo "- Files skipped: $skipped"
echo "- Render failures: $failed"
