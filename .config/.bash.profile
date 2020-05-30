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
PROMPT_COMMAND='history -a'
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

# Prompt string: exit status, git branch, current folder.
PS1='$?|$(git symbolic-ref --short HEAD 2> /dev/null)|\W\$'

# Git
[ -f ~/.config/.git-completion.bash ] && source ~/.config/.git-completion.bash
