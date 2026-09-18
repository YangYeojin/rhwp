#!/usr/bin/env bash
# Fast iteration build (debug). Usage: ./scripts/build-iter.sh [check]
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
MODE="${1:-build}"
docker run --rm \
  -v "$ROOT:/src" \
  -v rhwp-cargo-registry:/usr/local/cargo/registry \
  -v rhwp-cargo-git:/usr/local/cargo/git \
  -w /src rust:1.93.1-bookworm \
  sh -c "if [ \"$MODE\" = check ]; then cargo check --bin rhwp; else cargo build --bin rhwp && ls -la target/debug/rhwp; fi"
