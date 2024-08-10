#!/usr/bin/env bash

# Show loading message
echo "Loading..." | rofi -dmenu -p " " -lines 1 -theme ~/.config/rofi/wifi-menu.rasi &

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
FIELDS=SSID,SECURITY,BARS
LIST=$(nmcli --fields "$FIELDS" device wifi list | sed '/^--/d')
# For some reason rofi always approximates character width 2 short... hmmm
RWIDTH=$(($(echo "$LIST" | head -n 1 | awk '{print length($0); }')+2))
# Dynamically change the height of the rofi menu
LINENUM=$(echo "$LIST" | wc -l)
# Gives a list of known connections so we can parse it later
KNOWNCON=$(nmcli connection show)
# Really janky way of telling if there is currently a connection
CONSTATE=$(nmcli -fields WIFI g)
CURRSSID=$(LANGUAGE=C nmcli -t -f active,ssid dev wifi | awk -F: '$1 ~ /^yes/ {print $2}')

if [[ ! -z $CURRSSID ]]; then
	HIGHLINE=$(echo  "$(echo "$LIST" | awk -F "[  ]{2,}" '{print $1}' | grep -Fxn -m 1 "$CURRSSID" | awk -F ":" '{print $1}')" | bc )
fi

# HOPEFULLY you won't need this as often as I do
# If there are more than 8 SSIDs, the menu will still only have 8 lines
if [ "$LINENUM" -gt 8 ] && [[ "$CONSTATE" =~ "enabled" ]]; then
	LINENUM=8
elif [[ "$CONSTATE" =~ "disabled" ]]; then
	LINENUM=1
fi

if [[ "$CONSTATE" =~ "enabled" ]]; then
	TOGGLE="Off"
elif [[ "$CONSTATE" =~ "disabled" ]]; then
	TOGGLE="On"
fi

# kill the loading message
pkill rofi

CHENTRY=$(echo -e "$TOGGLE\n$LIST" | uniq -u | rofi -dmenu -p " " -lines "$LINENUM" -a "$HIGHLINE" -width -"$RWIDTH" -i -theme ~/.config/rofi/wifi-menu.rasi)
CHSSID=$(echo "$CHENTRY" | sed  's/\s\{2,\}/\|/g' | awk -F "|" '{print $1}')

if [ -z "$CHSSID" ]; then
	exit 0
fi

if [ "$CHENTRY" = "On" ]; then
	nmcli radio wifi on
elif [ "$CHENTRY" = "Off" ]; then
	nmcli radio wifi off
else
	# If the connection is already in use, then this will still be able to get the SSID
	if [ "$CHSSID" = "*" ]; then
		CHSSID=$(echo "$CHENTRY" | sed  's/\s\{2,\}/\|/g' | awk -F "|" '{print $3}')
	fi

	# Parses the list of preconfigured connections to see if it already contains the chosen SSID. This speeds up the connection process
	if [[ ! -z $(echo "$KNOWNCON" | grep "$CHSSID") ]]; then
		CONNECTIONRESULT=$(timeout 10s nmcli con up "$CHSSID")
		if [[ ! -z "$CONNECTIONRESULT" ]]; then
			exit 0
		fi
	fi
	if [[ "$CHENTRY" =~ "WPA2" ]] || [[ "$CHENTRY" =~ "WEP" ]]; then
		WIFIPASS=$(rofi -dmenu -p "  " -lines 0 -password -theme ~/.config/rofi/password.rasi)
	fi
	nmcli dev wifi con "$CHSSID" password "$WIFIPASS"
fi

# Clean up
pkill rofi
