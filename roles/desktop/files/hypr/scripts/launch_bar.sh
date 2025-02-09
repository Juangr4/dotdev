#!/bin/bash
if [[ ! $(pidof eww) ]]; then
	eww daemon
	sleep 2
fi

# monitors=($(hyprctl monitors -j | jq -r '.[] | .id'))
# for i in "${!monitors[@]}"; do
#     # Use unique IDs for each bar by appending monitor ID
#     bar_id="b${monitors[$i]}"
#     # Open the bar for each monitor with a unique ID
#     eww open --screen $i bar --id $bar_id
# done
eww open bar
