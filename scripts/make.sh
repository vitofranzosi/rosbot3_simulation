#!/bin/bash

# Build the workspace.
# Author: Vito Rodrigues Franzosi
# Date: 01.11.2025

colcon \
  --log-base     "make/log"     \
  build \
  --build-base   "make/build"   \
  --install-base "make/install" \
  "${@:1}"
