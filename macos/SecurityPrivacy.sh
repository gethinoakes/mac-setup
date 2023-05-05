#!/bin/bash
source "utils.sh"
# ---- Security & Privacy ---- #
# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Enable Secure Keyboard Entry in Terminal.app
# https://security.stackexchange.com/a/47786/8918
defaults write com.apple.terminal SecureKeyboardEntry -bool true
print_success "Done with Security & Privacy Settings"
