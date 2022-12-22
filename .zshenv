ZDOTDIR="$HOME/.config/zsh"
EDITOR=nvim
[ -d "$HOME/.local/bin" ] && path=("$HOME/.local/bin" $path)
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"
