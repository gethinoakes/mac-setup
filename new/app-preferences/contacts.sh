#!/usr/bin/env bash

###############################################################################
# Contacts
###############################################################################

# Show first name
# false : Before last name
# true  : Following last name
defaults write com.apple.AddressBook ABNameDisplay -bool false

# Sort by
defaults write com.apple.AddressBook ABNameSortingFormat -string "sortingLastName sortingFirstName"

# Short name format
# 0: Full Name
# 1: First Name & Last Initial
# 2: First Initial & Last Name
# 3: First Name Only
# 4: Last Name Only
defaults write com.apple.AddressBook ABShortNameStyle -int 2