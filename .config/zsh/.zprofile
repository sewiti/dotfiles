if [ -d "$HOME/.local/bin" ]; then
    path=("$HOME/.local/bin" $path)
fi
export EDITOR=nvim

if [ -z "$SSH_AGENT_PID" ] && (( $+commands[ssh-agent] )); then
    eval "$(ssh-agent)" >/dev/null
fi
