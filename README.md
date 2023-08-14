# dotfiles

My personal dotfiles, so far including `zsh` and `neovim`.

# Installation

Ensure `git` is installed and run the following to clone the repository in a
temporary directory and run `install.sh` script:

```sh
tmpdir="$(mktemp -d)"
git clone 'https://github.com/sewiti/dotfiles.git' "$tmpdir" && "$tmpdir/install.sh"
rm -rf "$tmpdir"
```
