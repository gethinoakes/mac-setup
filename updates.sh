#!/bin/bash
source "utils.sh"

# ---- Updates ---- #
# run this file periodically to update
# everything installed with homebrew
# and mac app store apps installed with MAS

# Update Homebrew
print_title "Updating Homebrew..."
brew update
brew upgrade
print_success "Homebrew updated."

# Update Mac App Store apps installed with mas
print_title "Updating MAS Apps..."
mas outdated | awk '{print $1}' | xargs mas upgrade
print_success "MAS Apps updated."

# Cleanup Homebrew
print_title "Brew cleanup..."
brew cleanup -s

# Print completion message
print_success "Finished updates."
