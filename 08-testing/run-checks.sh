#!/usr/bin/env bash
set -euo pipefail

echo "Running terraform fmt..."
terraform fmt -recursive

echo "Running terraform validate..."
terraform validate

echo "All basic checks passed."
