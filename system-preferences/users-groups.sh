#!/usr/bin/env bash

echo "\033[34;7m applying system preferences: users & groups \033[0m"

###############################################################################
# Users & Groups
###############################################################################

# Disable automatic login
sudo defaults delete /Library/Preferences/com.apple.loginwindow autoLoginUser 2>/dev/null

# Disable guest account
sudo defaults write /Library/Preferences/com.apple.loginwindow GuestEnabled -bool false

# Show fast user switching menu as:
# 0 : Full Name
# 1 : Account Name
# 2 : Icon
defaults write NSGlobalDomain userMenuExtraStyle -int 1

# Show password hints after count (0 to disable)
defaults write NSGlobalDomain RetriesUntilHint -int 0