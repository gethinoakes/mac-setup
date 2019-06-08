#!/usr/bin/env bash

echo "\033[34;7m applying system preferences: keyboard \033[0m"

###############################################################################
# Keyboard
###############################################################################

# Use smart quotes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Use smart dashes
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Prevent accidental Power button presses from sleeping system
defaults write com.apple.loginwindow PowerButtonSleepsSystem -bool false

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
# defaults write NSGlobalDomain AppleKeyboardUIMode -int 3
