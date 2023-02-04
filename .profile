# Default programs
export EDITOR=nvim
export SHELL=bash
export TERMINAL=kitty

# Standard directories
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export TMPDIR=/tmp

# Point applications to standard directories
mkdir -p "$XDG_STATE_HOME/bash"
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export HISTFILE="$XDG_STATE_HOME/bash/history"
export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"
export LEIN_HOME="$XDG_DATA_HOME"/lein
export LESSHISTFILE=/dev/null
export NVM_DIR="$XDG_DATA_HOME/nvm"
export PYENV_ROOT=$XDG_DATA_HOME/pyenv
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/startup.py"
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup

[ -f ~/.local/.profile ] && source ~/.local/.profile
[ -f ~/.config/.aliases ] && source ~/.config/.aliases
