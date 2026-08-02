ZDOTDIR="${HOME}/.config/zsh"
EDITOR=nvim
[ -d '/usr/local/go/bin' ]  && path=('/usr/local/go/bin'  $path)
[ -d "${HOME}/go/bin" ]     && path=("${HOME}/go/bin"     $path)
[ -d "${HOME}/.local/bin" ] && path=("${HOME}/.local/bin" $path)
