#!/bin/bash
set -e

echo "Checking application health"

for i in {1..30}
do
    if curl -fsS http://127.0.0.1:8000/todo > /dev/null
    then
        echo "Application is healthy"
        exit 0
    fi

    sleep 2
done

echo "Application health check failed"

journalctl -u note-cicd --no-pager -n 50

exit 1
