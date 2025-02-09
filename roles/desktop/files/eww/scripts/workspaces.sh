#!/bin/bash

n=7

workspaces() {
    declare -A array

    for ((i = 1; i <= n; i++)); do
        array["$i"]="0"
    done
    
    activeWS="$(hyprctl activeworkspace | grep -e 'workspace ID [0-9].' | awk '{print $3}')"

    readarray -t usedWorkspaces <<< "$(hyprctl workspaces | grep -e 'workspace ID' | awk '{print $3}')"

    for workspace_id in "${usedWorkspaces[@]}"; do
        if [ "$workspace_id" -le "$n" ]; then
            array["$workspace_id"]="2"
        fi
    done

    array["$activeWS"]="1"

    json_array="["
    for((i = 1; i <= n; i++)); do
        json_array+="${array[$i]}"
        if [ "$i" -ne "$n" ]; then
            json_array+=","
        fi
    done
    json_array+="]"

    echo "$json_array"
}

workspaces

socat -u UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - | while read -r event; do
    if [[ $event =~ "focusedmon" || $event =~ "workspace" ]]; then
        workspaces
    fi
done
