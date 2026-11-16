#!/bin/bash
set -e

echo "Stopping existing application"

systemctl stop note-cicd || true

mkdir -p /opt/note-cicd
