# 07 – Managing Multiple Environments

This module demonstrates a simple pattern for dev/staging/prod environments using
separate directories and backends.

## Structure

- `global/` – shared resources across all environments (if any)
- `envs/dev/` – dev-specific resources and backend
- `envs/staging/` – staging-specific resources and backend
- `envs/prod/` – prod-specific resources and backend

Each environment has its own state file in the same S3 bucket, but with a different key.
