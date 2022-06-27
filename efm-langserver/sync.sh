#!/bin/sh
set -eu

SCRIPT_DIR="$(
    cd "$(dirname "$0")"
    pwd
)"
cd "${SCRIPT_DIR}"

if [ "$1" = "link" ]; then
    ln -sfv "$(pwd)/config.yaml" "${HOME}/.config/efm-langserver/config.yaml"
else
    echo "wrong argument"
fi
