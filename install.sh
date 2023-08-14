#!/bin/sh
set -e

# Packages
if [ -f /etc/debian_version ]; then
	apt update
	apt install --yes curl git jq neovim wget zsh zsh-autosuggestions zsh-syntax-highlighting
elif [ -f /etc/redhat-release ]; then
	yum install --assumeyes curl git jq neovim wget zsh zsh-autosuggestions zsh-syntax-highlighting
elif [ -f /etc/arch-release ]; then
	pacman -Sy --noconfirm curl git jq neovim wget zsh zsh-autosuggestions zsh-completions zsh-syntax-highlighting
elif [ -f /etc/alpine-release ]; then
	apk update
	apk add curl git jq neovim wget zsh zsh-autosuggestions zsh-completions zsh-syntax-highlighting
fi
curl -fLo "${HOME}/.local/share/nvim/site/autoload/plug.vim" --create-dirs 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

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
mkdir -p "$TARGET/.config/nvim"
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
