#!/bin/bash
set -xe

if   [[ "${OSTYPE}" == darwin* ]]; then echo "TODO"
elif command -v apt    >/dev/null; then apt update && apt install -y        curl git neovim wget zsh zsh-autosuggestions zsh-syntax-highlighting passwd
elif command -v dnf    >/dev/null; then dnf install -y                      curl git neovim wget zsh zsh-autosuggestions zsh-syntax-highlighting util-linux-user
elif command -v zypper >/dev/null; then zypper refresh && zypper install -y curl git neovim wget zsh shadow 
elif command -v pacman >/dev/null; then pacman -Sy --noconfirm              curl git neovim wget zsh zsh-autosuggestions zsh-syntax-highlighting util-linux zsh-completions
fi

srcdir="$(dirname "$0")"
cp -f  "${srcdir}/.zshenv" "${HOME}/.zshenv"
cp -fa "${srcdir}/.config" "${HOME}/.config"
mkdir -p "${HOME}/.cache/zsh"

plugvim="${HOME}/.local/share/nvim/site/autoload/plug.vim" 
if [ ! -f "${plugvim}" ]; then
	curl -fLo "${plugvim}" --create-dirs 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	nvim --headless +PlugInstall +qa
fi

[[ "${SHELL}" == /bin/zsh ]] || chsh -s /bin/zsh
