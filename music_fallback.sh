#!/bin/bash

# Define the MPD command to play web radio
WEB_RADIO_URL="http://your-web-radio-stream-url"
MPD_CMD="mpc clear && mpc add  && mpc play"

# Function to check if Shairport Sync is playing
is_shairport_sync_playing() {
    if grep -q 'alsa' /tmp/shairport-sync.status; then
        return 0
    else
        return 1
    fi
}

# Function to check if Raspotify is playing
is_raspotify_playing() {
    if pgrep librespot > /dev/null; then
        return 0
    else
        return 1
    fi
}

# Function to display text on OLED (if enabled)
display_oled() {
#    python3 ~/oled_display.py "$1" "$2"
	echo "$1 | $2"
}

# Main loop to monitor and fallback to web radio
while true; do
    if is_shairport_sync_playing; then
        display_oled "AirPlay is active" ""
#    elif is_raspotify_playing; then
#        display_oled "Spotify is active" ""
    else
        display_oled "No streams active" "Playing Web Radio..."
        echo "No active streams detected. Falling back to web radio..."
        $MPD_CMD
    fi

    # Sleep for a minute before checking again
    sleep 5
done
