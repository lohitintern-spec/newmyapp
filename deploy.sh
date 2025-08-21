#!/usr/bin/env bash
set -euo pipefail

APP_DIR="${1:-/srv/myapps}"

echo "[deploy] Working in $APP_DIR"
cd "$APP_DIR"

echo "[deploy] Building and (re)starting containers..."
docker compose down || true
docker compose up -d --build

echo "[deploy] Pruning old images (safe)..."
docker image prune -f || true

echo "[deploy] Done."
