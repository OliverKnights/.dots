#!/bin/bash

if [[ $# != 1 ]]; then
    echo "Please specify either 'normal' or 'swap'"
    exit 1
fi

command="$1"
if [[ $command == "normal" ]]; then
    # Swap caps lock and escape, and disable altGr
    dconf write "/org/gnome/desktop/input-sources/xkb-options" "['caps:swapescape', 'lv3:ralt_alt']"
    # Set keyboard layout to AU (Kinesis keyboard)
    gdbus call --session --dest org.gnome.Shell \
	  --object-path /org/gnome/Shell \
	  --method org.gnome.Shell.Eval \
	  "imports.ui.status.keyboard.getInputSourceManager().inputSources[1].activate()"
elif [[ $command == "swap" ]]; then
    # Switch alt and ctrl
    dconf write "/org/gnome/desktop/input-sources/xkb-options" "['ctrl:swap_lalt_lctl','ctrl:swap_ralt_rctl']"
    # Set keyboard layout to UK
    gdbus call --session --dest org.gnome.Shell \
	  --object-path /org/gnome/Shell \
	  --method org.gnome.Shell.Eval \
	  "imports.ui.status.keyboard.getInputSourceManager().inputSources[0].activate()"

fi

