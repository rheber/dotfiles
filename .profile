# Default programs
export EDITOR=nvim
export SHELL=bash
export TERMINAL=kitty

export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export TMPDIR=/tmp

mkdir -p "$XDG_STATE_HOME/bash"
export HISTFILE="$XDG_STATE_HOME/bash/history"
export LESSHISTFILE=/dev/null
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/startup.py"

[ -f ~/.local/.profile ] && source ~/.local/.profile
[ -f ~/.config/.aliases ] && source ~/.config/.aliases
