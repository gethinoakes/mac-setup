#!/bin/bash
source "utils.sh"
# ---- Photos ---- #
# Prevent Photos from opening automatically when devices are plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

print_success "Done with Photos Settings"
