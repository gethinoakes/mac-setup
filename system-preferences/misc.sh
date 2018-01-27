#!/usr/bin/env bash

echo "\033[34;7m applying system preferences: miscellaneous \033[0m"

###############################################################################
# Miscellaneous
###############################################################################

# Disable automatic termination of inactive apps
# defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool false

# Remove duplicates in the “Open With” menu (also see `lscleanup` alias)
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user

# set number of columns in launchpad
defaults write com.apple.dock springboard-columns -int 5
