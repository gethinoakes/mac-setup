#!/usr/bin/env bash

echo "\033[34;7m applying system preferences: desktop & screensaver \033[0m"

###############################################################################
# Desktop & Screensaver                                                       #
###############################################################################

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0