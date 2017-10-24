#!/usr/bin/env bash

echo "\033[34;7m applying system preferences: bluetooth \033[0m"

###############################################################################
# Bluetooth
###############################################################################

# Increase sound quality for Bluetooth headphones/headsets
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40