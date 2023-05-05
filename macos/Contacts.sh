#!/bin/bash
source "utils.sh"
# ---- Contacts ---- #
# Show first name
# false : Before last name
# true  : Following last name
defaults write com.apple.AddressBook ABNameDisplay -bool false

# Sort by
defaults write com.apple.AddressBook ABNameSortingFormat -string "sortingLastName sortingFirstName"

print_success "Done with Contacts Settings"
