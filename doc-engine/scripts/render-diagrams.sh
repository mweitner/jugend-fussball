#!/usr/bin/env bash
set -euo pipefail

# Render PlantUML and Mermaid diagrams from .txt files in source/ and publish
# PNG + SVG artifacts to source/_static/diagrams while preserving relative paths.
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SOURCE_ROOT="$ROOT_DIR/source"
OUTPUT_DIR="$ROOT_DIR/source/_static/diagrams"

if [ ! -d "$SOURCE_ROOT" ]; then
  echo "Error: source directory not found: $SOURCE_ROOT" >&2
  exit 1
fi

if ! command -v plantuml >/dev/null 2>&1; then
  echo "Error: 'plantuml' command not found in PATH." >&2
  exit 1
fi

MERMAID_CMD=()
if command -v mmdc >/dev/null 2>&1; then
  MERMAID_CMD=(mmdc)
elif command -v npx >/dev/null 2>&1; then
  MERMAID_CMD=(npx --yes @mermaid-js/mermaid-cli)
else
  echo "Error: Mermaid renderer not found. Install 'mmdc' or ensure 'npx' is available." >&2
  exit 1
fi

mkdir -p "$OUTPUT_DIR"

rendered_files=0
skipped=0
failed=0

is_plantuml_file() {
  local file="$1"
  grep -Eiq '@start(uml|mindmap|wbs|gantt|json|yaml|ditaa|ebnf)' "$file"
}

is_mermaid_file() {
  local file="$1"
  local first_non_empty
  first_non_empty="$(awk 'NF {print; exit}' "$file" | tr -d '\r' | sed 's/^[[:space:]]*//')"
  [[ "$first_non_empty" =~ ^(flowchart|graph|sequenceDiagram|classDiagram|stateDiagram|stateDiagram-v2|erDiagram|journey|gantt|pie|gitGraph|mindmap|timeline|quadrantChart|requirementDiagram|xychart-beta|sankey-beta|packet-beta|block-beta|C4Context|C4Container|C4Component|C4Dynamic|C4Deployment)($|[[:space:]]) ]]
}

is_svg_file() {
  local file="$1"
  awk 'NF {print; exit}' "$file" | tr -d '\r' | grep -Eq '^[[:space:]]*<svg([[:space:]]|>)'
}

render_plantuml() {
  local src="$1"
  local rel_path="$2"
  local rendered_any=0

  for fmt in png svg; do
    if ! plantuml "-t$fmt" "$src" 2>/dev/null; then
      echo "Warning: PlantUML failed for $rel_path ($fmt)" >&2
      failed=$((failed + 1))
      continue
    fi

    local rel_out="${rel_path%.txt}.$fmt"
    local dst="$OUTPUT_DIR/$rel_out"
    local tmp_out="${src%.txt}.$fmt"

    mkdir -p "$(dirname "$dst")"
    if [ -f "$tmp_out" ]; then
      mv -f "$tmp_out" "$dst"
      echo "Rendered PlantUML ($fmt): source/$rel_path -> _static/diagrams/$rel_out"
      rendered_any=1
    fi
  done

  if [ "$rendered_any" -eq 1 ]; then
    rendered_files=$((rendered_files + 1))
  fi
}

render_mermaid() {
  local src="$1"
  local rel_path="$2"
  local rendered_any=0

  for fmt in png svg; do
    local rel_out="${rel_path%.txt}.$fmt"
    local dst="$OUTPUT_DIR/$rel_out"
    local tmp_out

    mkdir -p "$(dirname "$dst")"
    tmp_out="$(mktemp "/tmp/mermaid-XXXXXX.$fmt")"

    if ! "${MERMAID_CMD[@]}" -i "$src" -o "$tmp_out" >/dev/null 2>&1; then
      echo "Warning: Mermaid failed for $rel_path ($fmt)" >&2
      failed=$((failed + 1))
      rm -f "$tmp_out"
      continue
    fi

    mv -f "$tmp_out" "$dst"
    echo "Rendered Mermaid ($fmt): source/$rel_path -> _static/diagrams/$rel_out"
    rendered_any=1
  done

  if [ "$rendered_any" -eq 1 ]; then
    rendered_files=$((rendered_files + 1))
  fi
}

render_svg_source() {
  local src="$1"
  local rel_path="$2"
  local rendered_any=0
  local rel_base="${rel_path%.txt}"
  local svg_dst="$OUTPUT_DIR/$rel_base.svg"
  local png_dst="$OUTPUT_DIR/$rel_base.png"

  mkdir -p "$(dirname "$svg_dst")"
  cp "$src" "$svg_dst"
  echo "Rendered SVG source (svg): source/$rel_path -> _static/diagrams/$rel_base.svg"
  rendered_any=1

  if command -v rsvg-convert >/dev/null 2>&1; then
    if rsvg-convert "$src" -o "$png_dst" >/dev/null 2>&1; then
      echo "Rendered SVG source (png): source/$rel_path -> _static/diagrams/$rel_base.png"
    else
      echo "Warning: SVG to PNG conversion failed for $rel_path (rsvg-convert)" >&2
      failed=$((failed + 1))
    fi
  elif command -v magick >/dev/null 2>&1; then
    if magick "$src" "$png_dst" >/dev/null 2>&1; then
      echo "Rendered SVG source (png): source/$rel_path -> _static/diagrams/$rel_base.png"
    else
      echo "Warning: SVG to PNG conversion failed for $rel_path (magick)" >&2
      failed=$((failed + 1))
    fi
  elif command -v convert >/dev/null 2>&1; then
    if convert "$src" "$png_dst" >/dev/null 2>&1; then
      echo "Rendered SVG source (png): source/$rel_path -> _static/diagrams/$rel_base.png"
    else
      echo "Warning: SVG to PNG conversion failed for $rel_path (convert)" >&2
      failed=$((failed + 1))
    fi
  fi

  if [ "$rendered_any" -eq 1 ]; then
    rendered_files=$((rendered_files + 1))
  fi
}

process_file() {
  local src="$1"

  if [ ! -f "$src" ]; then
    return
  fi

  if [[ "$src" != "$SOURCE_ROOT"/* ]]; then
    skipped=$((skipped + 1))
    return
  fi

  local rel_path="${src#"$SOURCE_ROOT"/}"

  if [[ "$rel_path" =~ ^_static/ ]]; then
    skipped=$((skipped + 1))
    return
  fi

  if is_plantuml_file "$src"; then
    render_plantuml "$src" "$rel_path"
    return
  fi

  if is_svg_file "$src"; then
    render_svg_source "$src" "$rel_path"
    return
  fi

  if is_mermaid_file "$src"; then
    render_mermaid "$src" "$rel_path"
    return
  fi

  skipped=$((skipped + 1))
}

if [ $# -gt 0 ]; then
  REPO_ROOT="$(git -C "$ROOT_DIR" rev-parse --show-toplevel 2>/dev/null || (cd "$ROOT_DIR/.." && pwd))"
  for arg in "$@"; do
    if [[ "$arg" = /* ]]; then
      process_file "$arg"
    else
      process_file "$REPO_ROOT/$arg"
    fi
  done
else
  while IFS= read -r -d '' src; do
    process_file "$src"
  done < <(find "$SOURCE_ROOT" -type f -name '*.txt' -print0)
fi

echo ""
echo "Diagram generation complete (PlantUML + Mermaid, PNG + SVG)."
echo "- Source root: $SOURCE_ROOT"
echo "- Output root: $OUTPUT_DIR"
echo "- Diagram files rendered: $rendered_files"
echo "- Files skipped: $skipped"
echo "- Render failures: $failed"
