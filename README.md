# ToggleAirport

Small script to automatically disable/enable WiFi on OSX when a connected Thunderbolt Ethernet connection is found.

## Install

Run the following commands from your terminal:

```
mkdir -p ~/Library/Scripts/
git clone https://github.com/manuelvanrijn/ToggleAirport.git ~/Library/Scripts/ToggleAirport
chmod 755 ~/Library/Scripts/ToggleAirport/script.sh
cp ~/Library/Scripts/ToggleAirport/nl.manuelles.toggleairport.plist ~/Library/LaunchAgents/nl.manuelles.toggleairport.plist
launchctl load ~/Library/LaunchAgents/nl.manuelles.toggleairport.plist
```

## Temporarily enable/disable script

To temporarily enable or disable the tool from turning WiFi on or off, use the following commands

### Disable

```
launchctl unload ~/Library/LaunchAgents/nl.manuelles.toggleairport.plist
```

### Enable

```
launchctl load ~/Library/LaunchAgents/nl.manuelles.toggleairport.plist
```

## Todo

Make it indicate when we turn WiFi off manually when there is no ethernet connection.

At this point it will turn WiFi back on when disabling it manually
