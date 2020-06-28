########
# Dock #
########

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
  dockutil --add "/Applications/Firefox.app"
  dockutil --add "/Applications/Google Chrome.app"
  dockutil --add "/Applications/Spark.app" 
  dockutil --add "/Applications/OpenPHT.app" 
  dockutil --add "/Applications/Reeder.app" 
  dockutil --add "/System/Applications/Photos.app" 
  dockutil --add "/System/Applications/Notes.app" 
  dockutil --add "/System/Applications/Messages.app"
  
  # add a spacer 
  dockutil --add '' --type spacer --after 'Messages' --section apps
  
  # dev apps
  dockutil --add "/Applications/Visual Studio Code.app" --after ''
  dockutil --add "/Applications/Sourcetree.app" --after 'Visual Studio Code'
  dockutil --add "/System/Applications/Utilities/Terminal.app" --after 'Sourcetree'
  
  # add a spacer
  dockutil --add '' --type spacer --after 'Terminal' --section apps
  
  # system apps
  dockutil --add "/System/Applications/App Store.app" --after ''
  dockutil --add "/System/Applications/System Preferences.app" --after 'App Store'
  
  # add downloads folder to others section & relaunch dock
  dockutil --add '~/Downloads' --view grid --display folder --sort name --section others --replacing 'Downloads'
else # work dock

  # remove everything from dock
  dockutil --remove all

  # main apps
  dockutil --add "/Applications/Firefox.app"
  dockutil --add "/Applications/Google Chrome.app" --after 'Firefox'
  dockutil --add "/Applications/Safari.app" --after 'Firefox'
  dockutil --add "/Applications/Slack.app" --after 'Safari'
  dockutil --add "/System/Applications/Messages.app"
  dockutil --add "/Applications/Spark.app" --after 'Slack'
  dockutil --add "/Applications/Reeder.app" --after 'Spark'
  dockutil --add "/System/Applications/Notes.app" 
  
  # add a spacer
  dockutil --add '' --type spacer --after 'Notes' --section apps
  
  # dev apps
  dockutil --add "/Applications/Visual Studio Code.app" --after ''
  dockutil --add "/Applications/Sourcetree.app" --after 'Visual Studio Code'
  dockutil --add "/System/Applications/Utilities/Terminal.app" --after 'Sourcetree'
  
  # add a spacer
  dockutil --add '' --type spacer --after 'Terminal' --section apps
  
  # system apps
  dockutil --add "/System/Applications/System Preferences.app" --after ''
  
  # add downloads folder to others section & relaunch dock
  dockutil --add '~/Downloads' --view grid --display folder --sort name --section others --replacing 'Downloads'
fi
