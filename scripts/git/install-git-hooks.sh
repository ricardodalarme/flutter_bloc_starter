#!/bin/bash
set -e

SELF=$(basename "$0")
HOOKS_DIR=$(dirname "$0")  # Use "$0" directly to get the script's directory
GIT_COMMON_DIR=$(git rev-parse --show-toplevel)/.git  # Find the top-level .git directory

if [ ! -d "$GIT_COMMON_DIR/hooks" ]; then
    mkdir -p "$GIT_COMMON_DIR/hooks"
fi

for F in "$HOOKS_DIR"/*; do
    HOOK_NAME=$(basename "$F")
    if [ "$SELF" != "$HOOK_NAME" ] && [ -x "$F" ]; then
        echo "Installing $F as $GIT_COMMON_DIR/hooks/$HOOK_NAME"
        ln -sf "$F" "$GIT_COMMON_DIR/hooks/$HOOK_NAME"
    fi
done
