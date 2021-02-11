#!/bin/bash

if [[ $# != 1 ]]; then
    echo "Specify either 'up' or 'down'"
fi

command="$1"
if [[ $command == "up" ]]; then
    echo "Scaling up"
    gsettings set org.gnome.settings-daemon.plugins.xsettings overrides "[{'Gdk/WindowScalingFactor', <2>}]"
    gsettings set org.gnome.desktop.interface scaling-factor 2
    xrandr --output eDP-1 --scale 1.9x1.9
elif [[ $command == "down" ]]; then
    echo "Scaling down"
    gsettings set org.gnome.settings-daemon.plugins.xsettings overrides "[{'Gdk/WindowScalingFactor', <1>}]"
    gsettings set org.gnome.desktop.interface scaling-factor 1
    xrandr --output eDP-1 --transform none
fi
