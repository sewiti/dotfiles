# Aliases
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'

alias grep='grep --color'
alias sgrep='grep -R -n -H -C 5 --exclude-dir=.git'

alias cd..='cd ..'
alias ls='ls --color=auto'
alias la='ls -lAFh'
alias lt='ls -lAFht'
alias lu='ls -lAFhS'

alias dud='du -d 1 -h'
alias duf='du -sh *'

alias ff='find . -type f -name'
(( $+commands[fd] )) || alias fd='find . -type d -name'

alias ssh_config="${EDITOR:-nano} '${HOME}/.ssh/config'"
alias zshrc="${EDITOR:-nano} '${ZDOTDIR:-$HOME}/.zshrc'"
alias zshrc.local="${EDITOR:-nano} '${ZDOTDIR:-$HOME}/.zshrc.local'"

# Git aliases
alias gf='git fetch'
alias gl='git pull'

alias gco='git checkout'
alias gcb='git checkout -b'

alias ga='git add'
alias gaa='git add -A'

alias gc='git commit -v'
alias gc!='git commit -v --amend'
alias gcn!='git commit -v --no-edit --amend'
alias gca='git add -A && git commit -v'
alias gca!='git add -A && git commit -v --amend'
alias gcan!='git add -A && git commit -v --no-edit --amend'

alias glg='git log'
alias glgf="git log --pretty=format:'%C(bold blue)%<(20)%an%C(reset)%C(auto) %<(72)%s %h  %C(green)%ar%C(auto)%d%C(reset)'"

alias gp='git push'
alias gpf='git push --force-with-lease'
alias gpf!='git push --force'
alias gpublish='git push --set-upstream origin "$(git rev-parse --abbrev-ref HEAD)"'

alias grb='git rebase'
alias grbc='git rebase --continue'
alias grba='git rebase --abort'

alias grh='git reset --hard'
alias grho='git reset --hard "origin/$(git rev-parse --abbrev-ref HEAD)"'

alias grss='git restore --source'
alias grsts='git restore --staged --source'

alias gstl='git stash list'
alias gstp='git stash pop'
alias gstu='git stash --include-untracked'

# Keybinds
bindkey '^ '      autosuggest-accept
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
bindkey '^[[3;5~' kill-word
bindkey '^H'      backward-kill-word
bindkey '^[[3~'   delete-char
bindkey '^[[H'    beginning-of-line
bindkey '^[[F'    end-of-line
# Mac keybinds
bindkey '^[f'     forward-word
bindkey '^[b'     backward-word
bindkey '^[d'     kill-word
bindkey '^A'      beginning-of-line
bindkey '^E'      end-of-line

# SSH agent
if [ -z "${SSH_AUTH_SOCK}" ] && (( $+commands[ssh-agent] )); then
    eval "$(ssh-agent)" >/dev/null
fi

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
HISTFILE="${HOME}/.cache/zsh/.zsh_history"
setopt appendhistory

# Completion
ZSH_COMPDUMP="${HOME}/.cache/zsh/.zcompdump"
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit -d "${ZSH_COMPDUMP}"
_comp_options+=(globdots)

# Local config
if [ -f "${ZDOTDIR:-$HOME}/.zshrc.local" ]; then
    source "${ZDOTDIR:-$HOME}/.zshrc.local"
fi

# Plugins
if [[ "${OSTYPE}" == darwin* ]]; then
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
