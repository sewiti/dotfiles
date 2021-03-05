# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Load profile
[ -f "$HOME/.profile" ] && source "$HOME/.profile"


# Enable colors
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "


# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE="$HOME/.cache/zshhistory"
setopt appendhistory


# Basic aut/tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)


# Aliases
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias df='df -h'

alias cd..='cd ..'
alias ls='ls --color=auto'
alias ll='ls -alhF'
alias bc="BC_ENV_ARGS=<(echo 'scale=3') \bc -q"

alias free='free -m'
alias more='less'

alias yt-pl='youtube-dl -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]" -o "%(playlist_index)s. %(title)s.%(ext)s"'
alias yt-pl-a='youtube-dl -f "bestaudio[ext=m4a]" --add-metadata -o "%(playlist_index)s. %(title)s.%(ext)s"'
alias yt-v='youtube-dl -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]" -o "%(title)s.%(ext)s"'
alias yt-a='youtube-dl -f "bestaudio[ext=m4a]" --add-metadata -o "%(title)s.%(ext)s"'

alias teamviewerfix='sudo teamviewer --daemon start'


# Functions
lfcd () {
	if type lf>/dev/null; then
		tmp="$(mktemp)"
		lf -last-dir-path="$tmp" "$@"
		if [ -f "$tmp" ]; then
			dir="$(cat "$tmp")"
			rm -f "$tmp"
			[ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
		fi
	else
		type lf
	fi
}

ex ()
{
	if [ -f "$1" ]; then
		case "$1" in
			*.tar.bz2)   tar xjf "$1"   ;;
			*.tar.gz)    tar xzf "$1"   ;;
			*.tar.xz)    tar xJf "$1"   ;;
			*.bz2)       bunzip2 "$1"   ;;
			*.rar)       unrar x "$1"   ;;
			*.gz)        gunzip "$1"    ;;
			*.tar)       tar xf "$1"    ;;
			*.tbz2)      tar xjf "$1"   ;;
			*.tgz)       tar xzf "$1"   ;;
			*.zip)       unzip "$1"     ;;
			*.Z)         uncompress "$1";;
			*.7z)        7z x "$1"      ;;
			*)           echo "'$1' cannot be extracted via ex()" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}

git-zip ()
{
	[ "$#" -ne 1 ] && { echo "Usage: $0 <output>"; exit 1; }
	
	stash=${git stash create}
	git archive -9 -o "$1" ${stash:-HEAD}
}

corona ()
{
	curl -s 'https://corona-stats.online/lt?minimal=true' | head -3
}


# Keybinds
bindkey '^ ' autosuggest-accept
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
bindkey '^[[3;5~' kill-word
bindkey '^H' backward-kill-word
bindkey '^[[3~' delete-char
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey -s '^o' 'lfcd\n'


# Load plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null || source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null || source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/site-functions/git-flow-completion.zsh 2>/dev/null
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
