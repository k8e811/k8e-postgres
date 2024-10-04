#!/bin/bash
set -Eeuo pipefail
case "${1:-}" in
	''|-*|postgres) until [ -r /wait/start ]; do echo "Waiting on /wait/start"; date; sleep 60; done;;
esac
exec docker-entrypoint.sh "$@"

