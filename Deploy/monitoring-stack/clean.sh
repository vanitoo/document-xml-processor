#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
COMPOSE_FILE="$SCRIPT_DIR/docker-compose.yml"

usage() {
  cat <<EOF
Usage:
  $0 soft    - stop stack, remove containers, keep data
  $0 data    - stop stack, remove containers, clear local data folders
  $0 full    - stop stack, remove containers, volumes, and local data folders

Data folders cleared in modes: data, full
  - grafana-data
  - loki-data
  - prometheus-data

Examples:
  $0 soft
  $0 data
  $0 full
EOF
}

MODE="${1:-soft}"

if [[ ! -f "$COMPOSE_FILE" ]]; then
  echo "docker-compose.yml not found in $SCRIPT_DIR"
  exit 1
fi

run_compose() {
  docker compose \
    --project-directory "$SCRIPT_DIR" \
    -f "$COMPOSE_FILE" \
    "$@"
}

echo "[INFO] Project dir: $SCRIPT_DIR"
echo "[INFO] Mode: $MODE"

case "$MODE" in
  soft)
    echo "[INFO] Stopping and removing containers only..."
    run_compose down --remove-orphans
    ;;
  data)
    echo "[INFO] Stopping and removing containers..."
    run_compose down --remove-orphans

    echo "[INFO] Clearing local data directories..."
    rm -rf "$SCRIPT_DIR/grafana-data"/*
    rm -rf "$SCRIPT_DIR/loki-data"/*
    rm -rf "$SCRIPT_DIR/prometheus-data"/*

    echo "[INFO] Recreating data directories..."
    mkdir -p \
      "$SCRIPT_DIR/grafana-data" \
      "$SCRIPT_DIR/loki-data" \
      "$SCRIPT_DIR/prometheus-data"
    ;;
  full)
    echo "[INFO] Stopping and removing containers, networks, anonymous volumes..."
    run_compose down -v --remove-orphans

    echo "[INFO] Clearing local data directories..."
    rm -rf "$SCRIPT_DIR/grafana-data"
    rm -rf "$SCRIPT_DIR/loki-data"
    rm -rf "$SCRIPT_DIR/prometheus-data"

    echo "[INFO] Recreating empty data directories..."
    mkdir -p \
      "$SCRIPT_DIR/grafana-data" \
      "$SCRIPT_DIR/loki-data" \
      "$SCRIPT_DIR/prometheus-data"
    ;;
  *)
    usage
    exit 1
    ;;
esac

echo "[INFO] Done."
