#!/usr/bin/env bash
set -euo pipefail

PROJECT_DIR="${1:-.}"
OUTPUT_DIR="${2:-artifacts/dependency-graph}"
ENTRY_FILE="${3:-src/index.ts}"

mkdir -p "${OUTPUT_DIR}"

if ! command -v npx >/dev/null 2>&1; then
  echo "npx is not available. Skipping dependency graph generation."
  exit 0
fi

if [ ! -f "${PROJECT_DIR}/${ENTRY_FILE}" ]; then
  echo "Entry file ${PROJECT_DIR}/${ENTRY_FILE} not found. Skipping graph generation."
  exit 0
fi

npx madge --json "${PROJECT_DIR}/${ENTRY_FILE}" > "${OUTPUT_DIR}/graph.json"
if command -v dot >/dev/null 2>&1; then
  npx madge --image "${OUTPUT_DIR}/graph.svg" "${PROJECT_DIR}/${ENTRY_FILE}"
fi

echo "Dependency graph artifacts were generated under ${OUTPUT_DIR}"
