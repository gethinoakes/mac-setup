#!/usr/bin/env bash

###############################################################################
# iTunes
###############################################################################

# Show iTunes notifications in the Dock
defaults write com.apple.dock itunes-notifications -bool TRUE
defaults write com.apple.dock notification-always-show-image -bool TRUE