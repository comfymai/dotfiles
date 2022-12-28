export SWWW_TRANSITION_FPS=60
export SWWW_TRANSITION_STEP=2

# Every 12 minutes
INTERVAL=720

# Points to lighter wallpapers during daytime or dark ones during nighttime
case $(date +%H) in
	07 | 08 | 09 | 10 | 11 | 12 | 13 | 14 | 15 | 16 | 17)
        WALLPAPER_SELECTION=$META_WALLPAPERS_DAY
		;;
	18 | 19 | 20 | 21 | 22 | 23 | 00 | 01 | 02 | 03 | 04 | 05 | 06)
        WALLPAPER_SELECTION=$META_WALLPAPERS_NIGHT
		;;
esac

# Picks a random wallpaper from a pool based on time
while true; do
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
