#!/bin/bash

print() {
    type=$(nmcli -f TYPE connection show --active | awk 'NR==2')
    wifiStatus=$(nmcli r wifi)
    localIP=$(ip route | awk 'NR==1 { print $9 }')
    interface=$(ip route get 1.1.1.1 | awk '{ print $5 }' | tr -d '\n' | cut -f1 -d '%')
    strength=""
    if [[ $type == "wifi" ]]; then
        strength=$(nmcli -f IN-USE,SIGNAL device wifi | grep '*' | awk '{print $2}')
    fi
    JSON_STRING=$(jq -n \
        --arg type "$type" \
        --arg wifiStatus "$wifiStatus" \
        --arg localIP "$localIP" \
        --arg interface "$interface" \
        --arg strength "$strength" \
        '{type: $type, wifiStatus: $wifiStatus, localIP: $localIP, interface: $interface, strength: $strength}')
    echo $JSON_STRING
}

print

nmcli monitor | while read -r _; do
    print
done
