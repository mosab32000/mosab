#!/usr/bin/env bash
set -euo pipefail

PROJECT_DIR="${1:-.}"
OUTPUT_DIR="${2:-artifacts/static-analysis}"

mkdir -p "${OUTPUT_DIR}"

if [ -f "${PROJECT_DIR}/package.json" ]; then
  if command -v npx >/dev/null 2>&1; then
    if [ -f "${PROJECT_DIR}/.eslintrc.js" ] || [ -f "${PROJECT_DIR}/eslint.config.js" ]; then
      npx eslint "${PROJECT_DIR}" --ext .js,.ts,.tsx -f json -o "${OUTPUT_DIR}/eslint-report.json" || true
    fi
  fi
fi

if command -v pylint >/dev/null 2>&1; then
  PY_FILES=$(find "${PROJECT_DIR}" -type f -name "*.py" -not -path "*/.venv/*" -not -path "*/node_modules/*" || true)
  if [ -n "${PY_FILES}" ]; then
    pylint ${PY_FILES} --output-format=json > "${OUTPUT_DIR}/pylint-report.json" || true
  fi
fi

echo "Static analysis reports available under ${OUTPUT_DIR}"
