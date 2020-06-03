# Default programs
export EDITOR=vim
export SHELL=bash

export VIMINIT='if !has("nvim") | source $HOME/.config/.vimrc | endif'

[ -f ~/.local/.profile ] && source ~/.local/.profile
[ -f ~/.config/.aliases ] && source ~/.config/.aliases
