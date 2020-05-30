# Default programs
export EDITOR=vim

# Git
[ -f ~/.config/.git-completion.bash ] && source ~/.config/.git-completion.bash

# NVM
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

[ -f ~/.local/.profile ] && source ~/.local/.profile
[ -f ~/.config/.aliases ] && source ~/.config/.aliases
