#!/usr/bin/env bash

echo "\033[34;7m applying system preferences: sound \033[0m"

###############################################################################
# Sound
###############################################################################

# Play user interface sound effects
# defaults write com.apple.systemsound com.apple.sound.uiaudio.enabled -bool false

# Play feedback when volume is changed
defaults write NSGlobalDomain com.apple.sound.beep.feedback -bool true