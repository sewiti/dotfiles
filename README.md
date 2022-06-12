# dotfiles

My personal dotfiles, so far including `zsh` and `neovim`.

# Installation

Clone and run
```sh
./install.sh
# or
./install.sh --symbolic
```

Change shell
```sh
chsh -s /bin/zsh
```

## Packages

[neovim (latest)](https://github.com/neovim/neovim/releases/latest) |
[zsh-completions](https://software.opensuse.org/download.html?project=shells:zsh-users:zsh-completions&package=zsh-completions)

### Debian

```sh
apt install -y git neovim zsh zsh-autosuggestions zsh-syntax-highlighting
```

### Fedora

```sh
dnf install -y git neovim zsh zsh-autosuggestions zsh-syntax-highlighting
```

### Arch

```sh
pacman -S --noconfirm git neovim zsh zsh-autosuggestions zsh-completions zsh-syntax-highlighting
```
