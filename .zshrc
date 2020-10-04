# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Enable colors
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "


# Env variables
export EDITOR=/usr/bin/micro
export ANDROID_HOME=$HOME/Android/Sdk
export BC_ENV_ARGS=$HOME/.config/.bc


# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zshhistory
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
alias bc='bc -q'

alias free='free -m'
alias more='less'
alias pac='sudo pacman'

alias teamviewer-fix='sudo teamviewer --daemon start'
alias adb-over-network='adb connect 192.168.10.68:5555'


# Functions
lfcd () {
	tmp="$(mktemp)"
	lf -last-dir-path="$tmp" "$@"
	if [ -f "$tmp" ]; then
		dir="$(cat "$tmp")"
		rm -f "$tmp"
		[ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
	fi
}

ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.tar.xz)    tar xJf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

hotspot ()
{
	if [ "$#" -eq 1 ] ; then
		echo "Running hotspot from $1"
		echo "SSID: minde-laptop"
		echo "Pass: mindaugelis"
		sudo create_ap wlp3s0 $1 minde-laptop mindaugelis
	else
		echo "Usage: $0 <interface>"
	fi
}

hotspot-wifi ()
{
	hotspot wlp3s0
}

hotspot-ethernet ()
{
	hotspot enp2s0
}

instagram-dl ()
{
	if [ "$#" -eq 2 ] ; then
		url="$1"media?size=l
		echo Downloading "$url"
		wget -q -O "$2".jpg "$url"
		echo Saved $(pwd)/"$2".jpg
	else
		echo "Usage: '$0 url output'"
	fi
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
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /etc/profile.d/autojump.sh 2>/dev/null
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme 2>/dev/null


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
