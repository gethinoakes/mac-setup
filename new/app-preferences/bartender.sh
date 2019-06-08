#!/usr/bin/env bash

###############################################################################
# Bartender 3
###############################################################################

# Bartender has launched before
defaults write com.surteesstudios.Bartender SUHasLaunchedBefore -bool true

# Check for Updates Automatically
defaults write com.surteesstudios.Bartender SUAutomaticallyUpdate -bool true

# When on battery, decrease update checking
defaults write com.surteesstudios.Bartender ReduceUpdateCheckFrequencyWhenOnBattery -bool true

# Update to Test Builds, even though they may be unstable
# defaults write com.surteesstudios.Bartender SUFeedURL -string "http://www.macbartender.com/B2/updates/TestUpdates.php"

# Bartender menu bar icon visible
defaults write com.surteesstudios.Bartender showMenuBarIcon -bool true

# Bartender menu bar icon:
# Waistcoat, Bartender, Bowtie, Glasses, Star, Box
defaults write com.surteesstudios.Bartender statusBarImageNamed -string "More"
