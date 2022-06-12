#!/bin/sh
set -e

# Options
TARGET="${TARGET:-$HOME}"
for arg in "$@"; do
    case "$arg" in
        -s|-symbolic|--symbolic)
            USE_SYMLINKS=1
            ;;
        *)
            echo "unknown argument: $arg"
            echo "usage: $0 [-s|--symbolic]"
            exit 1
            ;;
    esac
done
[ -z "$USE_SYMLINKS" ] || echo "Using symbolic links"

# Install
mkdir -p "$TARGET/.config/zsh"
mkdir -p "$TARGET/.cache/zsh"

FILES=$(find . -path ./.git -prune -o -path ./README.md -prune -o -path ./install.sh -prune -o -type f -print | sed -E 's/^\.\///')
for f in $FILES; do
    echo "Installing $TARGET/$f"
    if [ -z "$USE_SYMLINKS" ]; then
        cp --remove-destination "$PWD/$f" "$TARGET/$f"
    else
        ln -sf "$PWD/$f" "$TARGET/$f"
    fi
done
