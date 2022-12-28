export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="af-magic"

source $HOME/.profile
source $ZSH/oh-my-zsh.sh

plugins=(git)

export EDITOR='nvim'

PATH=$PATH:$HOME/.local/bin

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
