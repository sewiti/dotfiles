# Aliases
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'

alias more='less'
alias grep='grep --color'
alias sgrep='grep -R -n -H -C 5 --exlude-dir=.git'

alias cd..='cd ..'
alias ls='ls --color=auto'
alias l='ls -lFh'
alias la='ls -lAFh'
alias lr='ls -tRFh'
alias lt='ls -ltFh'
alias ll='ls -l'

alias dud='du -d 1 -h'
alias duf='du -sh *'
alias ff='find . -type f -name'
(( $+commands[fd] )) || alias fd='find . -type d -name'

alias zshrc="${EDITOR:-nano} '${ZDOTDIR:-$HOME}/.zshrc'"

# Keybinds
bindkey '^ '      autosuggest-accept
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
bindkey '^[[3;5~' kill-word
bindkey '^H'      backward-kill-word
bindkey '^[[3~'   delete-char
bindkey '^[[H'    beginning-of-line
bindkey '^[[F'    end-of-line

# Functions
function ex() {
    [ "$#" -eq 0 ] && echo "no files provided" && return 1

    for v in "$@"; do
        if [ -f "$v" ]; then
            case "$v" in
                *.tar.bz2)   tar xjf "$v"   ;;
                *.tar.gz)    tar xzf "$v"   ;;
                *.tar.xz)    tar xJf "$v"   ;;
                *.bz2)       bunzip2 "$v"   ;;
                *.rar)       unrar x "$v"   ;;
                *.gz)        gunzip "$v"    ;;
                *.tar)       tar xf "$v"    ;;
                *.tbz2)      tar xjf "$v"   ;;
                *.tgz)       tar xzf "$v"   ;;
                *.zip)       unzip "$v"     ;;
                *.Z)         uncompress "$v";;
                *.7z)        7z x "$v"      ;;
                *)           echo "'$v' cannot be extracted via ex()" ;;
            esac
        else
            echo "'$v' is not a valid file"
        fi
    done
}

# Prompt
autoload -Uz colors && colors
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats ' %b'
PROMPT='%B%F{141}%n%F{147}@%m%F{195}:%F{153}%~%F{139}${vcs_info_msg_0_}%(?.%F{195}.%F{203})%(!.#.$)%f%b '

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE="$HOME/.cache/zsh/.zsh_history"
setopt appendhistory

# Completion
ZSH_COMPDUMP="$HOME/.cache/zsh/.zcompdump"
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit -d "$ZSH_COMPDUMP"
_comp_options+=(globdots)

# Local config
if [ -f "${ZDOTDIR:-$HOME}/.zshrc.local" ]; then
    source "${ZDOTDIR:-$HOME}/.zshrc.local"
fi

# Plugins
if [[ "$OSTYPE" == darwin* ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
    source "$(brew --prefix)/opt/zsh-autosuggestions/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
    source "$(brew --prefix)/opt/zsh-syntax-highlighting/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
elif [ -f "/etc/arch-release" ]; then
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
else
    source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
