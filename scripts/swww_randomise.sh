export SWWW_TRANSITION_FPS=60
export SWWW_TRANSITION_STEP=2

INTERVAL=600

while true; do
    # Points to lighter wallpapers during daytime or dark ones during nighttime
    case $(date +%H) in
        06 | 07 | 08 | 09 | 10 | 11 | 12 | 13 | 14 | 15 | 16 | 17)
            WALLPAPER_SELECTION=$HOME/meta/wallpapers/day/
            ;;
        18 | 19 | 20 | 21 | 22 | 23 | 00 | 01 | 02 | 03 | 04 | 05)
            WALLPAPER_SELECTION=$HOME/meta/wallpapers/night/
            ;;
    esac

	find "$WALLPAPER_SELECTION" \
		| while read -r img; do
			echo "$((RANDOM % 1000)):$img"
		done \
		| sort -n | cut -d':' -f2- \
		| while read -r img; do
			swww img "$img"
			sleep $INTERVAL
		done
done
