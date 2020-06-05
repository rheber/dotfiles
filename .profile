# Default programs
export EDITOR=nvim
export SHELL=bash

# XDG
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

[ -f ~/.local/.profile ] && source ~/.local/.profile
[ -f ~/.config/.aliases ] && source ~/.config/.aliases
