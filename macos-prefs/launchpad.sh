#!/usr/bin/env bash

###############################################################################
# Launchpad                                                                   #
###############################################################################

# Change number of columns and rows
defaults write com.apple.dock springboard-columns -int 8
defaults write com.apple.dock springboard-rows -int 5
defaults write com.apple.dock ResetLaunchPad -bool TRUE;killall Dock
