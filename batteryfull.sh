#!/usr/bin/env bash

while true; do
  export DISPLAY=:0.0
  battery_percent=$(acpi -b | grep -P -o '[0-9]+(?=%)')
  if on_ac_power; then
    if [ "$battery_percent" -gt 95 ]; then
      kdialog --title "Backup Complete" --sorry "Battery full.\nLevel: ${battery_percent}% "
      paplay /usr/share/sounds/Oxygen-Im-Nudge.ogg
    fi
  fi
  sleep 300 # (5 minutes)
done
