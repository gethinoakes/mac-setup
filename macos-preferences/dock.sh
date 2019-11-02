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

# Add apps and spacers to dock depending on user
read -p "Setup dock for personal or work? [p/w] " -r

echo
if [[ $REPLY =~ ^[Pp]$ ]]; then
  # remove everything from dock
  dockutil --remove all

  # main apps
  dockutil --add "/Applications/Google Chrome.app" --no-restart
  dockutil --add "/Applications/Spark.app" --after 'Google Chrome' --no-restart
  dockutil --add "/Applications/OpenPHT.app" --after 'Spark' --no-restart
  dockutil --add "/Applications/Reeder.app" --after 'OpenPHT' --no-restart
  dockutil --add "/Applications/Photos.app" --after 'Reeder' --no-restart
  dockutil --add "/Applications/Notes.app" --after 'Photos' --no-restart
  dockutil --add "/Applications/Messages.app" --after 'Notes' --no-restart
  
  # add a spacer 
  dockutil --add '' --type spacer --after 'Messages' --section apps --no-restart
  
  # dev apps
  dockutil --add "/Applications/Visual Studio Code.app" --after '' --no-restart
  dockutil --add "/Applications/Sourcetree.app" --after 'Visual Studio Code' --no-restart
  dockutil --add "/Applications/Utilities/Terminal.app" --after 'Sourcetree' --no-restart
  # dockutil --add "/Applications/Sketch.app" --after 'Terminal' --no-restart
  
  # add a spacer
  dockutil --add '' --type spacer --after 'Terminal' --section apps --no-restart
  
  # system apps
  dockutil --add "/Applications/App Store.app" --after '' --no-restart
  dockutil --add "/Applications/System Preferences.app" --after 'App Store' --no-restart
  
  # add downloads folder to others section & relaunch dock
  dockutil --add '~/Downloads' --view grid --display folder --sort name --section others --replacing 'Downloads'

  killall Dock
  
else # work dock

  # remove everything from dock
  dockutil --remove all

  # main apps
  dockutil --add "/Applications/Google Chrome.app" --no-restart
  dockutil --add "/Applications/Firefox.app" --after 'Google Chrome' --no-restart
  dockutil --add "/Applications/Safari.app" --after 'Firefox' --no-restart
  dockutil --add "/Applications/Slack.app" --after 'Safari' --no-restart
  dockutil --add "/Applications/Spark.app" --after 'Slack' --no-restart
  dockutil --add "/Applications/Reeder.app" --after 'Spark' --no-restart
  dockutil --add "/Applications/Notes.app" --after 'Reeder' --no-restart
  
  # add a spacer
  dockutil --add '' --type spacer --after 'Notes' --section apps --no-restart
  
  # dev apps
  dockutil --add "/Applications/Visual Studio Code.app" --after '' --no-restart
  dockutil --add "/Applications/Sourcetree.app" --after 'Visual Studio Code' --no-restart
  dockutil --add "/Applications/Utilities/Terminal.app" --after 'Sourcetree' --no-restart
  
  # add a spacer
  dockutil --add '' --type spacer --after 'Terminal' --section apps --no-restart
  
  # system apps
  dockutil --add "/Applications/System Preferences.app" --after '' --no-restart
  
  # add downloads folder to others section & relaunch dock
  dockutil --add '~/Downloads' --view grid --display folder --sort name --section others --replacing 'Downloads'

  killall Dock
fi
