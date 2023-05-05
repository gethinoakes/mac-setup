#!/bin/bash
source "utils.sh"
# ---- Accessibility ---- #
# enable three finger drag
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true

print_success "Done with Accessibility Settings"
