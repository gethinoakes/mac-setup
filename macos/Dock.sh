#!/bin/bash
source "utils.sh"
# ---- Dock ---- #
# Set the icon size of Dock items
defaults write com.apple.dock tilesize -int 50

# Dock magnification
defaults write com.apple.dock magnification -bool false

# Icon size of magnified Dock items
# defaults write com.apple.dock largesize -int 90

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

# Automatically hide and show the Dock & remove show delay
defaults write com.apple.dock autohide -bool true
defaults write com.apple.Dock autohide-delay -float 0
# defaults delete com.apple.Dock autohide-delay

# Show indicator lights for open applications
defaults write com.apple.dock show-process-indicators -bool true

# Highlight hover effect for the grid view of a stack
defaults write com.apple.dock mouse-over-hilite-stack -bool true

# Don’t show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

# Add apps and spacers to dock
dockutil --remove all
dockutil --add "/Applications/Brave Browser.app"
dockutil --add "/System/Applications/Messages.app" --after 'Brave Browser'
dockutil --add "/System/Applications/Photos.app" --after 'Messages'
dockutil --add "//Applications/FMail2.app" --after 'Photos'
dockutil --add "//Applications/Mimestream.app" --after 'FMail2'
dockutil --add "/System/Applications/Notes.app" --after 'Mimestream'
dockutil --add "/System/Applications/GoodLinks.app" --after 'Notes'
dockutil --add "/Applications/Spotify.app" --after 'GoodLinks'

dockutil --add '' --type spacer --after 'Spotify' --section apps

dockutil --add "/Applications/Visual Studio Code.app" --after ''
dockutil --add "/Applications/Setapp/Gitfox.app" --after 'Visual Studio Code'
dockutil --add "/System/Applications/Utilities/Terminal.app" --after 'Gitfox'

dockutil --add '' --type spacer --after 'Terminal' --section apps

dockutil --add "/System/Applications/System Settings.app" --after ''

dockutil --add '~/Downloads' --view grid --display folder --sort name --section others --replacing 'Downloads'
killall Dock

print_success "Done with Dock Settings"
