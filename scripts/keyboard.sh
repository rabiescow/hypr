#!/bin/bash
# Wait a moment for the device to be ready
sleep 1

# Set display and user info for the script's environment
export DISPLAY=:0
export XAUTHORITY=/home/anon/.Xauthority # Change 'anon' if your username is different

# Run the command
/usr/bin/xkbcomp "-I$HOME/.config/xkb" "$HOME/.config/xkb/keymaps/rabid" $DISPLAY
