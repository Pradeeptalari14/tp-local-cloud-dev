#!/usr/bin/env bash
# Validation script for Docker Compose Sandbox
set -euo pipefail

echo "🚀 Validating SRE properties..."
echo "🔍 Checking container status..."
docker ps --filter "name=local-cloud"

echo "🔍 Verifying database connection on port 7432..."
nc -z -v -w5 localhost 7432 || echo "⚠️ Database offline or port closed"

echo "🔍 Verifying cache connection on port 7379..."
nc -z -v -w5 localhost 7379 || echo "⚠️ Cache offline or port closed"

echo "✅ Local Cloud Sandbox validation checks complete."
