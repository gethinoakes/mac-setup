#!/usr/bin/env bash

echo "\033[34;7m applying system preferences: app store \033[0m"

###############################################################################
# App Store
###############################################################################

# Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# Automatically check for updates
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

# Don't download newly available updates in the background
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticDownload -bool false

# Install app updates
sudo defaults write /Library/Preferences/com.apple.commerce AutoUpdate -bool false

# Install macOS updates
sudo defaults write /Library/Preferences/com.apple.commerce AutoUpdateRestartRequired -bool false

# Install system data files and security updates
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate ConfigDataInstall -bool true
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate CriticalUpdateInstall -bool true