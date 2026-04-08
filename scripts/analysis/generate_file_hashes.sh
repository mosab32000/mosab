#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="${1:-.}"
OUTPUT_DIR="${2:-artifacts}"
OUTPUT_FILE="${OUTPUT_DIR}/file-hashes.sha256"

mkdir -p "${OUTPUT_DIR}"

find "${ROOT_DIR}" -type f \
  -not -path "*/.git/*" \
  -not -path "*/node_modules/*" \
  -not -path "*/dist/*" \
  -not -path "*/coverage/*" \
  -print0 \
  | sort -z \
  | xargs -0 sha256sum > "${OUTPUT_FILE}"

echo "Generated ${OUTPUT_FILE}"
