#!/usr/bin/env bash

echo "\033[34;7m applying system preferences: dock \033[0m"

###############################################################################
# Dock
###############################################################################

# Set the icon size of Dock items to 60 pixels
defaults write com.apple.dock tilesize -int 60

# Dock magnification
defaults write com.apple.dock magnification -bool true

# Icon size of magnified Dock items
defaults write com.apple.dock largesize -int 90

# Minimization effect: 'genie', 'scale', 'suck'
defaults write com.apple.dock mineffect -string 'scale'

# Prefer tabs when opening documents: 'always', 'fullscreen', 'manual'
defaults write NSGlobalDomain AppleWindowTabbingMode -string 'always'

# Double-click a window's title bar to:
# None
# Mimimize
# Maximize (zoom)
defaults write NSGlobalDomain AppleActionOnDoubleClick -string "Mimimize"

# Don't minimize windows into their application’s icon
defaults write com.apple.dock minimize-to-application -bool false

# Animate opening applications
defaults write com.apple.dock launchanim -bool true

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Show indicator lights for open applications
defaults write com.apple.dock show-process-indicators -bool true

# Highlight hover effect for the grid view of a stack
defaults write com.apple.dock mouse-over-hilite-stack -bool true

# Remove all (default) app icons from the Dock
defaults write com.apple.dock persistent-apps -array

# Add apps and spacers to dock
# main apps
dockutil --no-restart --add "/Applications/Google Chrome.app"
dockutil --no-restart --add "/Applications/Spark.app"
dockutil --no-restart --add "/Applications/OpenPHT.app"
dockutil --no-restart --add "/Applications/Photos.app"
dockutil --no-restart --add "/Applications/iTunes.app"
dockutil --no-restart --add "/Applications/iBooks.app"
dockutil --no-restart --add "/Applications/Notes.app"
dockutil --no-restart --add "/Applications/GoodTask.app"
dockutil --no-restart --add "/Applications/Transmission.app"
# add a spacer
dockutil --add '' --type spacer --section apps --after Transmission
# defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'
# social apps
dockutil --no-restart --add "/Applications/Messages.app"
dockutil --no-restart --add "/Applications/Telegram Desktop.app"
dockutil --no-restart --add "/Applications/Slack.app"
# add a spacer 
dockutil --add '' --type spacer --section apps --after Slack
# defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'
# dev apps
dockutil --no-restart --add "/Applications/Xcode.app"
dockutil --no-restart --add "/Applications/Visual Studio Code.app"
dockutil --no-restart --add "/Applications/Sourcetree.app"
dockutil --no-restart --add "/Applications/Utilities/Terminal.app"
dockutil --no-restart --add "/Applications/Sketch.app"
# add a spacer 
dockutil --add '' --type spacer --section apps --after Sketch
# defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'
# system apps
dockutil --no-restart --add "/Applications/App Store.app"
dockutil --no-restart --add "/Applications/System Preferences.app"
# add downloads folder to others section
dockutil --add '~/Downloads' --view grid --display folder --sort name --section others --replacing 'Downloads'