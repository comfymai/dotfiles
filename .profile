export MOZ_ENABLE_WAYLAND=1
export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_TYPE=wayland
export WLR_NO_HARDWARE_CURSORS=1
#export WLR_NO_HARDWARE_CURSORS=0
export WLR_RENDERER_ALLOW_SOFTWARE=1

export TERMINAL=alacritty

export META_WALLPAPERS_DAY=$HOME/meta/wallpapers/day/
export META_WALLPAPERS_NIGHT=$HOME/meta/wallpapers/night/

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

alias pacman="sudo pacman"

# Mic feedback
alias mic-loop="pactl load-module module-loopback"
alias mic-unloop="pactl unload-module module-loopback"

alias vi="nvim"
alias vim="nvim"

. "$HOME/.cargo/env"

# Some shorthands for common tmux actions
alias tx="tmux"
alias txn="tmux new"
alias txl="tmux list-sessions"
alias txa="tmux attach -t"

# TUI To-do
alias todo="dooit"
