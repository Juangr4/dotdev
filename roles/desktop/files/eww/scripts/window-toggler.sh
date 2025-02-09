#!/bin/bash

state=$(eww get "open_$1")

case $state in
    true)
        eww close $1-closer
        eww update "open_$1=false"
        eww close $1
        ;;
    false)
        eww open $1-closer
        eww update "open_$1=true"
        eww open $1
        ;;
esac
