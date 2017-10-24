#!/usr/bin/env bash

echo "\033[34;7m applying system preferences: time machine \033[0m"

###############################################################################
# Time Machine
###############################################################################

# Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# Disable local Time Machine backups
hash tmutil &>/dev/null && sudo tmutil disablelocal