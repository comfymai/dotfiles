#!/bin/bash
 
entries="Active Screen Output Area Window"
 
selected=$(printf '%s\n' $entries | wofi --style=$HOME/.config/wofi/style.widgets.css --conf=$HOME/.config/wofi/config.screenshot | awk '{print tolower($1)}')
 
case $selected in
  active)
    sleep 1 && /usr/share/sway/scripts/grimshot --notify save active;;
  screen)
    sleep 1 && /usr/share/sway/scripts/grimshot --notify save screen;;
  output)
    sleep 1 && /usr/share/sway/scripts/grimshot --notify save output;;
  area)
    sleep 1 && /usr/share/sway/scripts/grimshot --notify save area;;
  window)
    sleep 1 && /usr/share/sway/scripts/grimshot --notify save window;;
esac
