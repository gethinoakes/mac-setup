#!/bin/bash
source "utils.sh"
# ---- Desktop & Screensaver ---- #
# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0
print_success "Done with Desktop & Screensaver Settings"
