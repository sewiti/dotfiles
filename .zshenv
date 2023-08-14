ZDOTDIR="${HOME}/.config/zsh"
EDITOR=nvim
[ -d "${HOME}/.local/bin" ] && path=("${HOME}/.local/bin" $path)
[ -d /usr/local/go/bin ] && path=(/usr/local/go/bin $path)
