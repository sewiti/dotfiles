if [ -d "$HOME/.local/bin" ]; then
    path=("$HOME/.local/bin" $path)
fi

export EDITOR=nvim
