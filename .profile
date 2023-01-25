export MOZ_ENABLE_WAYLAND=1
export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_TYPE=wayland
export WLR_NO_HARDWARE_CURSORS=1
export WLR_RENDERER_ALLOW_SOFTWARE=1
export QT_QPA_PLATFORM=wayland

export TERMINAL=alacritty

export ANDROID_HOME=/opt/android-sdk/

# See ~/scripts/swww_randomise.sh
export META_WALLPAPERS_DAY=$HOME/meta/wallpapers/day/
export META_WALLPAPERS_NIGHT=$HOME/meta/wallpapers/night/

source $HOME/.zsh_aliases

. "$HOME/.cargo/env"

