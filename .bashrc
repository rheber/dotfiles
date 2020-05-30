# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Window size
shopt -s checkwinsize

# Enable colours
if [ -x /usr/bin/dircolors ]
then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# History
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000

# Programmable completion
if ! shopt -oq posix
then
  if [ -f /usr/share/bash-completion/bash_completion ]
  then
    source /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]
  then
    source /etc/bash_completion
  fi
fi

# Prompt command
promptCommand () {
  local exitStatus="$?"
  history -a

  local red='\[\033[31m\]'
  local green='\[\033[32m\]'
  local yellow='\[\033[33m\]'
  local blue='\[\033[34m\]'
  local magenta='\[\033[35m\]'
  local cyan='\[\033[36m\]'
  local normal='\[\033[00m\]'

  PS1=''
  if [ $exitStatus == 0 ]
  then
    PS1+="${green}"
  else
    PS1+="${red}"
  fi
  PS1+='$?'
  PS1+="${normal}|"
  PS1+="${magenta}"
  PS1+='$(git symbolic-ref --short HEAD 2> /dev/null)'
  PS1+="${normal}|"
  PS1+="${cyan}\W"
  PS1+="${yellow}\$"
  PS1+="${normal} "
}
PROMPT_COMMAND=promptCommand

# Git
[ -f ~/.config/.git-completion.bash ] && source ~/.config/.git-completion.bash

source ~/.profile
