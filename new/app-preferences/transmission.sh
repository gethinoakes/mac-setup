#!/usr/bin/env bash

###############################################################################
# Transmission
###############################################################################

## General

# Automatically size window to fit all transfers
defaults write org.m0k.transmission AutoSize -bool true

# Download & Upload Badges
defaults write org.m0k.transmission BadgeDownloadRate -bool true
defaults write org.m0k.transmission BadgeUploadRate   -bool false

# Prompt user for removal of active transfers only when downloading
defaults write org.m0k.transmission CheckRemove -bool false

# Prompt user for quit with active transfers only when downloading
defaults write org.m0k.transmission CheckQuit -bool false


## Transfers

# Create folders for downloads
mkdir -p "${HOME}/Downloads/torrents/complete"
mkdir -p "${HOME}/Downloads/torrents/active"

# Default download location
defaults write org.m0k.transmission DownloadLocationConstant -bool true
defaults write org.m0k.transmission DownloadChoice -string "Constant"
defaults write org.m0k.transmission DownloadFolder -string "${HOME}/Downloads/Torrents/complete"

# Set incomplete downloads location
defaults write org.m0k.transmission UseIncompleteDownloadFolder -bool true
defaults write org.m0k.transmission IncompleteDownloadFolder -string "${HOME}/Downloads/Torrents/active"

# Don’t prompt for confirmation before downloading
defaults write org.m0k.transmission DownloadAsk -bool false
defaults write org.m0k.transmission MagnetOpenAsk -bool false

# Don’t ask about opening magnets
defaults write org.m0k.transmission MagnetOpenAsk -bool false

# Trash original torrent files
defaults write org.m0k.transmission DeleteOriginalTorrent -bool true

# Display window when opening a torrent file
defaults write org.m0k.transmission DownloadAskMulti -bool false
defaults write org.m0k.transmission DownloadAskManual -bool false

# Automatic Import
defaults write org.m0k.transmission AutoImport -bool true
defaults write org.m0k.transmission AutoImportDirectory -string "$HOME/Downloads/"

# Download limit
defaults write org.m0k.transmission DownloadLimit -int 150

# Ratio Limit
defaults write org.m0k.transmission RatioCheck -int 1

# Remove when done
defaults write org.m0k.transmission RemoveWhenFinishSeeding -bool true

# Speed limit
defaults write org.m0k.transmission SpeedLimit -bool true
defaults write org.m0k.transmission SpeedLimitAuto -bool true
defaults write org.m0k.transmission SpeedLimitAutoOffDate -string "2000-01-01 06:00:00 +0000"
defaults write org.m0k.transmission SpeedLimitAutoOnDate -string "2000-01-01 00:00:00 +0000"
defaults write org.m0k.transmission SpeedLimitDownloadLimit -int 100000
defaults write org.m0k.transmission SpeedLimitUploadLimit -int 10

# Ratio Limit
defaults write org.m0k.transmission RatioCheck -bool true

# Ratio Limit
defaults write org.m0k.transmission RatioCheck -bool true




## Network

# Randomize port on launch
defaults write org.m0k.transmission RandomPort -bool true

# IP block list.
# Source: https://giuliomac.wordpress.com/2014/02/19/best-blocklist-for-transmission/
defaults write org.m0k.transmission BlocklistNew -bool true
defaults write org.m0k.transmission BlocklistURL -string "http://john.bitsurge.net/public/biglist.p2p.gz"
defaults write org.m0k.transmission BlocklistAutoUpdate -bool true


## Startup

# Donate message
defaults write org.m0k.transmission WarningDonate -bool false

# Legal disclaimer
defaults write org.m0k.transmission WarningLegal -bool false


## View

# Status bar
defaults write org.m0k.transmission StatusBar -bool true

# Small view
defaults write org.m0k.transmission AutoSize -int 1

# Pieces bar
defaults write org.m0k.transmission PiecesBar -bool false

# Filter bar
defaults write org.m0k.transmission FilterBar -bool true

# Pieces bar
defaults write org.m0k.transmission FilterBar -bool true

# Availability
defaults write org.m0k.transmission DisplayProgressBarAvailable -bool false