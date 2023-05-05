#!/bin/bash
source "utils.sh"
# ---- Users & Groups ---- #
# Disable guest account
sudo defaults write /Library/Preferences/com.apple.loginwindow GuestEnabled -bool false

# Show fast user switching menu as:
# 0 : Full Name
# 1 : Account Name
# 2 : Icon
defaults write NSGlobalDomain userMenuExtraStyle -int 2

# Show password hints after count (0 to disable)
defaults write NSGlobalDomain RetriesUntilHint -int 0

print_success "Done with User & Group Settings"
