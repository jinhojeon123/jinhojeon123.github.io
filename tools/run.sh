#!/usr/bin/env bash
# Preview locally; pass --production to use production asset behavior.
set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")/.."

host="127.0.0.1"
while (($#)); do
  case "$1" in
    -H|--host)
      [[ $# -ge 2 ]] || { echo "Missing --host value" >&2; exit 1; }
      host="$2"
      shift 2
      ;;
    -p|--production)
      export JEKYLL_ENV=production
      shift
      ;;
    -h|--help)
      echo "Usage: bash tools/run.sh [-H host] [-p|--production]"
      exit 0
      ;;
    *) echo "Unknown option: $1" >&2; exit 1 ;;
  esac
done

exec bundle exec jekyll serve --livereload --host "$host"