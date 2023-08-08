#!/bin/bash
# Based on code from: https://codeberg.org/JustineSmithies/hyprland-dotfiles/src/branch/master/.config/eww/scripts/network.sh

if [ "$(nmcli connection show --active | grep -oh "\w*ethernet\w*")" == "ethernet" ]; then
  echo "󰈀 "
elif [ "$(nmcli connection show --active | grep -oh "\w*wifi\w*")" == "wifi" ]; then
  echo "󰖩 "
else 
  echo "󰖪 "
fi
