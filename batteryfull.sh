#!/usr/bin/env bash

while true; do
  export DISPLAY=:0.0
  battery_percent=$(acpi -b | grep -P -o '[0-9]+(?=%)')
  if on_ac_power; then
    if [ "$battery_percent" -gt 95 ]; then
      paplay /usr/share/sounds/Oxygen-Im-Nudge.ogg
      kdialog --title "Battery Complete" --sorry "Battery full.\nLevel: ${battery_percent}% "
    fi
  fi
  sleep 180 # (3 minutes)
done
