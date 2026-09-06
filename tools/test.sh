#!/usr/bin/env bash
# Production build and deterministic internal link / image checks.
set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")/.."

config="_config.yml"
while (($#)); do
  case "$1" in
    -c|--config)
      [[ $# -ge 2 ]] || { echo "Missing --config value" >&2; exit 1; }
      config="$2"
      shift 2
      ;;
    -h|--help)
      echo "Usage: bash tools/test.sh [-c file.yml[,other.yml]]"
      exit 0
      ;;
    *) echo "Unknown option: $1" >&2; exit 1 ;;
  esac
done

bundle exec jekyll clean --config "$config"
JEKYLL_ENV=production bundle exec jekyll build --config "$config" --destination _site --trace
bundle exec htmlproofer _site --disable-external