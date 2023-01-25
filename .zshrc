# Plugin manager
source ~/home/maya/.config/zsh/zsh-snap/znap.zsh

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="intheloop"

source $HOME/.profile
source $ZSH/oh-my-zsh.sh

plugins=(git)

export EDITOR='nvim'

PATH=$PATH:$HOME/.local/bin

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

znap source marlonrichert/zsh-autocomplete
znap source zsh-users/zsh-syntax-highlighting

