#!/bin/bash
set -xe

if [[ "${OSTYPE}" != darwin* ]] && [ -z "${INSTALL_PKGS}" ]; then
	read -p "Would you like to install packages? (y/n)" INSTALL_PKGS
fi
if [[ "${INSTALL_PKGS}" =~ [yY] ]]; then
	if [ -z "${SUDO_PREFIX}" ] && [ "${EUID}" -ne 0 ]; then
		SUDO_PREFIX=sudo
	fi

	if [[ "${OSTYPE}" == darwin* ]]; then
		echo "TODO"
	elif command -v apt >/dev/null; then
		${SUDO_PREFIX} apt update && ${SUDO_PREFIX} apt install -y curl git neovim wget zsh zsh-autosuggestions zsh-syntax-highlighting passwd
	elif command -v dnf >/dev/null; then
		${SUDO_PREFIX} dnf install -y curl git neovim wget zsh zsh-autosuggestions zsh-syntax-highlighting util-linux-user
	elif command -v zypper >/dev/null; then
		${SUDO_PREFIX} zypper refresh && ${SUDO_PREFIX} zypper install -y curl git neovim wget zsh shadow 
	elif command -v pacman >/dev/null; then
		${SUDO_PREFIX} pacman -Sy --noconfirm curl git neovim wget zsh zsh-autosuggestions zsh-syntax-highlighting util-linux zsh-completions
	fi
fi

srcdir="$(dirname "$0")"
cp -f  "${srcdir}/.zshenv" "${HOME}/"
cp -fa "${srcdir}/.config" "${HOME}/"
mkdir -p "${HOME}/.cache/zsh"

plugvim="${HOME}/.local/share/nvim/site/autoload/plug.vim" 
if [ ! -f "${plugvim}" ]; then
	curl -fLo "${plugvim}" --create-dirs 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	nvim --headless +PlugInstall +qa
fi

[ "${SHELL}" = /bin/zsh ] || chsh -s /bin/zsh
