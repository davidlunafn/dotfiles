#!/bin/bash

# You can call this script like this:
# $./volume.sh up
# $./volume.sh down
# $./volume.sh mute

function get_volume {
    amixer -D pulse get Master | grep '%' | head -n 1 | cut -d '[' -f 2 | cut -d '%' -f 1
}

function is_mute {
    amixer -D pulse get Master | grep '%' | grep -oE '[^ ]+$' | grep off > /dev/null
}

function send_notification {
    DIR=`dirname "$0"`
    volume=`get_volume`
    # Make the bar with the special character ─ (it's not dash -)
    # https://en.wikipedia.org/wiki/Box-drawing_character
    if [ "$volume" = "0" ]; then
        icon_name="~/.config/qtile/icons/Faba-notifications/notification-audio-volume-muted.svg"
        dunstify -a "Volume $volume" -i "$icon_name" -t 2000 "$bar" -r 555
    else
	if [  "$volume" -lt "10" ]; then
	    icon_name="~/.config/qtile/icons/Faba-notifications/notification-audio-volume-low.svg"
        dunstify -a "Volume $volume" -i "$icon_name" -t 2000 "$bar" -r 555
    else
        if [ "$volume" -lt "30" ]; then
            icon_name="~/.config/qtile/icons/Faba-notifications/notification-audio-volume-low.svg"
        else
            if [ "$volume" -lt "70" ]; then
                icon_name="~/.config/qtile/icons/Faba-notifications/notification-audio-volume-medium.svg"
            else
                icon_name="~/.config/qtile/icons/Faba-notifications/notification-audio-volume-high.svg"
            fi
        fi
    fi
fi
bar=$(seq -s "█" 0 $(($volume/5)) | sed 's/[0-9]//g')
name='Volumen '
# Send the notification
dunstify -a "Volumen" "Volumen ${volume} %" -i "$icon_name" -r 555 -u normal "$bar"

}

case $1 in
    up)
	# Set the volume on (if it was muted)
	amixer -D pulse set Master on > /dev/null
	# Up the volume (+ 5%)
	amixer -D pulse sset Master 5%+ > /dev/null
	send_notification
	;;
    down)
	amixer -D pulse set Master on > /dev/null
	amixer -D pulse sset Master 5%- > /dev/null
	send_notification
	;;
    mute)
    	# Toggle mute
	amixer -D pulse set Master 1+ toggle > /dev/null
	if is_mute ; then
    DIR=`dirname "$0"`
    dunstify -i "~/.config/sway/icons/Faba-notifications/notification-audio-volume-muted.svg" -u normal "Mute" -t 2000 -r 555 -a "Volume" 
	else
	    send_notification
	fi
	;;
esac
