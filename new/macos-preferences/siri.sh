#!/usr/bin/env bash

echo "\033[34;7m applying system preferences: siri \033[0m"

###############################################################################
# Siri
###############################################################################

# Enable Siri
defaults write com.apple.assistant.support "Assistant Enabled" -bool true

# Language
defaults write com.apple.assistant.backedup "Session Language" -string "en-GB"

# Voice Feedback
# 2 : On
# 3 : Off
defaults write com.apple.assistant.backedup "Use device speaker for TTS" -int 3

# Keybord shortcut
# 0 : Off
# 2 : Hold Command Space
# 3 : Hold Option Space
# 4 : Press Fn (Function) Space
# 7 : Customize
defaults write com.apple.Siri HotkeyTag -int 2
# defaults write com.apple.Siri CustomizedKeyboardShortcut

# Don't show Siri in menu bar
defaults write com.apple.Siri StatusMenuVisible -bool false