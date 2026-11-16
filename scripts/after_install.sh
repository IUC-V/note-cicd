#!/bin/bash
set -e

echo "Installing production dependencies"

cd /opt/note-cicd

npm ci --omit=dev

chown -R ec2-user:ec2-user /opt/note-cicd

NPM_BIN=$(command -v npm)

cat > /etc/systemd/system/note-cicd.service <<EOF
[Unit]
Description=Note CICD Node.js Application
After=network.target

[Service]
Type=simple
User=ec2-user
WorkingDirectory=/opt/note-cicd
ExecStart=${NPM_BIN} start
Restart=always
RestartSec=5
Environment=NODE_ENV=production

[Install]
WantedBy=multi-user.target
EOF
