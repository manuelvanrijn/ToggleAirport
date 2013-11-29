#!/bin/bash

function notify {
  ~/Library/Scripts/ToggleAirport/bin/terminal-notifier.app/Contents/MacOS/terminal-notifier -sender com.apple.airport.airportutility -title "$1" -message "$2"
}

function connected {
  if [ -n "$1" ]; then
    # Check actual current ethernet status
    if [ "`ifconfig $1 | grep \"status: active\"`" != "" ]; then
      # Device is ON
      return 0
    else
      # Device is OFF
      return 1
    fi
  fi
  # Device is OFF, not found or empty string given...
  return 1
}

# get current wifi device
WIFI=$(networksetup -listallhardwareports | awk '$3=="Wi-Fi" {getline; print $2}')
echo "Current Wi-Fi Device = '$WIFI'"

# get current thunderbolt ethernet device
ETH=$(networksetup -listallhardwareports | awk '$3 ~ /Thunderbolt/ && /Ethernet/ {getline; print $2}')
echo "Current ETH Device = '$ETH'"

if connected "$ETH" && connected "$WIFI"; then
  # turn wifi off
  networksetup -setairportpower $WIFI off
  notify "Wifi turned Off" "Ethernet changed to enabled"
elif ! connected "$ETH" && ! connected "$WIFI"; then
  # turn wifi on
  networksetup -setairportpower $WIFI on
  notify "Wifi turned On" "Ethernet changed to disabled"
fi

exit 0
