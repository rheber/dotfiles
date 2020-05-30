# Default programs
export EDITOR=vim

[ -n $BASH ] && [ -f ~/.config/.bash.profile ] && source ~/.config/.bash.profile

[ -f ~/.local/.profile ] && source ~/.local/.profile
[ -f ~/.config/.aliases ] && source ~/.config/.aliases
