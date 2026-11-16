#!/bin/bash
set -e

echo "Starting Node.js application"

systemctl daemon-reload

systemctl enable note-cicd

systemctl restart note-cicd
