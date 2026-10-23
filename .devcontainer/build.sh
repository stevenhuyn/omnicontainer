#!/usr/bin/env bash
# Fast iteration loop: builds the exact image the devcontainer uses, straight
# through podman. Full output, layer cache, and the Dockerfile's self-test line
# means a green build == working toolchain. Only "Reopen in Container" after
# this passes.
set -euo pipefail
cd "$(dirname "$0")"
podman build -t devbox --build-arg TZ="${TZ:-Australia/Melbourne}" .
echo "OK: image 'devbox' built and self-test passed."