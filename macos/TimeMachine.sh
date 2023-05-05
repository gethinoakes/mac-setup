#!/bin/bash
source "utils.sh"
# ---- Time Machine ---- #
print_step "Don't prompt to use new hard drives as backup volume"
# don't prompt to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

print_step "Speed up Time Machine backups"
# speed up backups
sudo sysctl debug.lowpri_throttle_enabled=0

print_success "Done with Time Machine Settings"
