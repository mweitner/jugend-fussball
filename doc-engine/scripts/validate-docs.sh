#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "$REPO_ROOT"

if ! command -v pre-commit >/dev/null 2>&1; then
  echo "error: pre-commit not found in PATH" >&2
  exit 1
fi

if ! command -v sphinx-build >/dev/null 2>&1; then
  echo "error: sphinx-build not found in PATH" >&2
  exit 1
fi

echo "[validate-docs] Rendering diagram artifacts..."
bash ./doc-engine/scripts/render-diagrams.sh

echo "[validate-docs] Running markdownlint via pre-commit..."
mapfile -t md_files < <(rg --files doc-engine/source \
  -g '*.md' \
  -g '!doc-engine/source/_static/**' \
  -g '!doc-engine/source/requirement-sources/supplier-pilots/kiesgrube-biberach/product-owner/snapshots/**' \
  -g '!doc-engine/source/requirement-sources/supplier-pilots/kiesgrube-biberach/product-owner/snapshot-log.md')
if [ "${#md_files[@]}" -gt 0 ]; then
  pre-commit run markdownlint --files "${md_files[@]}"
else
  echo "[validate-docs] No markdown files found under doc-engine/source"
fi

echo "[validate-docs] Running clean Sphinx HTML build..."
sphinx-build -b html doc-engine/source doc-engine/build/html -E

echo "[validate-docs] OK"
