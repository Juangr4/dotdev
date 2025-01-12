#!/bin/sh

rm -r $HOME/.config/eww 2> /dev/null
rm -r $HOME/.config/zellij 2> /dev/null
rm $HOME/.config/starship.toml 2> /dev/null

ACTUAL_PATH=$(pwd)
ln -s $ACTUAL_PATH/eww $HOME/.config/eww
ln -s $ACTUAL_PATH/zellij $HOME/.config/zellij
ln -s $ACTUAL_PATH/starship.toml $HOME/.config/starship.toml
