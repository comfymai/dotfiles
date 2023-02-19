#!/bin/bash
 
entries="Active Screen Output Area Window"
 
selected=$(printf '%s\n' $entries | wofi --style=$HOME/.config/wofi/style.widgets.css --conf=$HOME/.config/wofi/config.screenshot | awk '{print tolower($1)}')
 
case $selected in
  active)
    sleep 1 && /usr/share/sway/scripts/grimshot --notify copy active;;
  screen)
    sleep 1 && /usr/share/sway/scripts/grimshot --notify copy screen;;
  output)
    sleep 1 && /usr/share/sway/scripts/grimshot --notify copy output;;
  area)
    sleep 1 && /usr/share/sway/scripts/grimshot --notify copy area;;
  window)
    sleep 1 && /usr/share/sway/scripts/grimshot --notify copy window;;
esac
