#!/usr/bin/env bash
# a simple screenshot script tool for hyprland
# requires: slurp, grim, wl-copy, notify-send, wofi.

getOutputDirectory() {
  test -f "${XDG_CONFIG_HOME:-$HOME/.config}/user-dirs.dirs" && \
    . "${XDG_CONFIG_HOME:-$HOME/.config}/user-dirs.dirs"

  echo "${XDG_SCREENSHOTS_DIR:-${XDG_PICTURES_DIR:-$HOME}}"
}

FILE=$(getOutputDirectory)/$(date -Ins).png
TEMP_FILE="/tmp/$(date -Ins).png"

copyScreen() {
    wl-copy < "$TEMP_FILE"
    rm $TEMP_FILE
}

saveScreen() {
    mv $TEMP_FILE $FILE
}

takeScreenshot() {
    FRAME=$(slurp)

    if [ -z "$FRAME" ]; then
        exit 1
    fi

    grim -g "$FRAME" - | tee "$TEMP_FILE">/dev/null

    ACTION=$(getAction)

    if [ $ACTION = "copy" ]; then
        if sleep 1 && copyScreen; then
            notify-send -t 3000 "Copied selected area to clipboard!"
        fi
    elif [ $ACTION = "save" ]; then
        if sleep 1 && saveScreen; then
            notify-send -t 3000 "Saved selected area to $FILE!"
        fi
    else
        notify-send -t 3000 "Action cancelled!"
        rm $TEMP_FILE
    fi

}

getAction() {
    ACTIONS="Copy Save"
    SELECTED=$(printf '%s\n' $ACTIONS | wofi --style=$HOME/.config/wofi/style.widgets.css --conf=$HOME/.config/wofi/config.screenshot | awk '{print tolower($1)}')
    echo "$SELECTED"
}

takeScreenshot
