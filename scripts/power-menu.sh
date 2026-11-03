#!/bin/sh

chosen=$(printf "  Lock\n  Logout\n  Suspend\n  Reboot\n  Shutdown" | \
    rofi -dmenu -i -p "Power" -theme ~/.config/rofi/power-menu.rasi)

case "$chosen" in
    *Lock)     swaylock -c 1a1a1a ;;
    *Logout)   swaymsg exit ;;
    *Suspend)  systemctl suspend ;;
    *Reboot)   systemctl reboot ;;
    *Shutdown) systemctl poweroff ;;
esac
