#!/usr/bin/env bash

function echo_ok { echo -e '\033[1;32m🔥 '"$1"'\033[0m'; }
function echo_warning { echo -e '\033[1;33m⚠️ '" $1"'\033[0m'; }

# Close any open System Preferences panes, to prevent them from overriding settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

####################################################################
# Accessibility                                                    #
####################################################################
echo_warning "Applying accessibility settings"

# enable three finger drag
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true

####################################################################
# Activity Monitor                                                 #
####################################################################
echo_warning "Applying activity monitor settings"

# Show the main window when launching Activity Monitor
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

# Visualize CPU usage in the Activity Monitor Dock icon
defaults write com.apple.ActivityMonitor IconType -int 5

# Sort Activity Monitor results by CPU usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

####################################################################
# App Store & Software Updates                                     #
####################################################################
echo_warning "Applying app store & software update settings"

# Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# Automatically check for updates
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

# Download newly available updates in the background
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticDownload -bool true

# Install app updates
sudo defaults write /Library/Preferences/com.apple.commerce AutoUpdate -bool true

# Install macOS updates
sudo defaults write /Library/Preferences/com.apple.commerce AutoUpdateRestartRequired -bool false

# Install system data files and security updates
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate ConfigDataInstall -bool true
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate CriticalUpdateInstall -bool true

####################################################################
# Contacts                                                         #
####################################################################
echo_warning "Applying contacts settings"

# Show first name
# false : Before last name
# true  : Following last name
defaults write com.apple.AddressBook ABNameDisplay -bool false

# Sort by
defaults write com.apple.AddressBook ABNameSortingFormat -string "sortingLastName sortingFirstName"

####################################################################
# Desktop & Screensaver                                            #
####################################################################
echo_warning "Applying desktop & screensaver settings"

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

####################################################################
# Dock                                                             #
####################################################################
echo_warning "Applying dock settings"

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

# Don’t show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

# Add apps and spacers to dock
dockutil --remove all
dockutil --add "/Applications/Google Chrome.app"
dockutil --add "/Applications/Spark.app" --after 'Google Chrome'
dockutil --add "/System/Applications/Photos.app" --after 'Spark'
dockutil --add "/System/Applications/Notes.app" --after 'Photos'
dockutil --add "/System/Applications/Messages.app" --after 'Notes'
dockutil --add "/System/Applications/Slack.app" --after 'Messages'
dockutil --add "/System/Applications/Spotify.app" --after 'Slack'

dockutil --add '' --type spacer --after 'Messages' --section apps

dockutil --add "/Applications/Visual Studio Code.app" --after ''
dockutil --add "/Applications/Xcode.app" --after 'Visual Studio Code'
dockutil --add "/Applications/Setapp/Gitfox.app" --after 'Xcode'
dockutil --add "/System/Applications/Utilities/Terminal.app" --after 'Gitfox'

dockutil --add '' --type spacer --after 'Terminal' --section apps

dockutil --add "/System/Applications/App Store.app" --after ''
dockutil --add "/System/Applications/System Settings.app" --after 'App Store'
dockutil --add '~/Downloads' --view grid --display folder --sort name --section others --replacing 'Downloads'
killall Dock

####################################################################
# Finder                                                           #
####################################################################
echo_warning "Applying finder settings"
# Show user `Library` folder
chflags nohidden "${HOME}/Library"

# Icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop         -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop     -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop     -bool false

# Finder appearance
defaults write NSGlobalDomain AppleShowAllExtensions -bool true     # Filename extensions
defaults write com.apple.finder ShowStatusBar -bool true            # Status bar
defaults write com.apple.finder ShowPathbar -bool true              # Path bar
defaults write com.apple.finder ShowTabView -bool true              # Tab bar
defaults write com.apple.finder QLEnableTextSelection -bool true    # Text selection in Quick Look

# Search scope
# This Mac       : `SCev`
# Current Folder : `SCcf`
# Previous Scope : `SCsp`
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# File extension change warning
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Arrange by
# Kind, Name, Application, Date Last Opened,
# Date Added, Date Modified, Date Created, Size, Tags, None
defaults write com.apple.finder FXPreferredGroupBy -string "Name"

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Writing of .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool false
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool false

# Disable disk image verification
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

# Show item info near icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist

# Show item info on the bottom of icons
/usr/libexec/PlistBuddy -c "Set DesktopViewSettings:IconViewSettings:labelOnBottom true" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:labelOnBottom true" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:labelOnBottom true" ~/Library/Preferences/com.apple.finder.plist

# Enable snap-to-grid for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

# Increase grid spacing for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist

# Increase the size of icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 44" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:iconSize 44" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:iconSize 44" ~/Library/Preferences/com.apple.finder.plist

# Preferred view style
# Icon View   : `icnv`
# List View   : `Nlsv`
# Column View : `clmv`
# Cover Flow  : `Flwv`
# After configuring preferred view style, clear all `.DS_Store` files
# to ensure settings are applied for every directory
# sudo find / -name ".DS_Store" --delete
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

# New window target
# Computer     : `PfCm`
# Volume       : `PfVo`
# $HOME        : `PfHm`
# Desktop      : `PfDe`
# Documents    : `PfDo`
# All My Files : `PfAF`
# Other…       : `PfLo`
defaults write com.apple.finder NewWindowTarget -string 'PfHm'

# Expand the following File Info panes:
# “General”, “Open with”, and “Sharing & Permissions”
defaults write com.apple.finder FXInfoPanesExpanded -dict \
    General -bool true \
    MetaData -bool true \
    Name -bool true \
    OpenWith -bool true \
    Privileges -bool true

####################################################################
# General UI/UX                                                    #
####################################################################
echo_warning "Applying general UI/UX settings"

# Menu bar: show remaining battery time (on pre-10.8); hide percentage
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# Sidebar icon size
# Small  : 1
# Medium : 2
# Large  : 3
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 1

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Disable automatic capitalization as it’s annoying when typing code
#defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disable smart dashes as they’re annoying when typing code
#defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disable automatic period substitution as it’s annoying when typing code
#defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Disable smart quotes as they’re annoying when typing code
#defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool false

# Remove duplicates in the “Open With” menu (also see `lscleanup` alias)
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user

# change how long a notification shows on screen
defaults write com.apple.notificationcenterui bannerTime 2

# Play feedback when volume is changed
defaults write NSGlobalDomain com.apple.sound.beep.feedback -bool true

# Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

####################################################################
# Launchpad & Mission Control                                      #
####################################################################
echo_warning "Applying mission control settings"

# Change number of columns and rows in launchpad
defaults write com.apple.dock springboard-columns -int 8
defaults write com.apple.dock springboard-rows -int 5
defaults write com.apple.dock ResetLaunchPad -bool TRUE;killall Dock

# Automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# When switching to an application, switch to a Space with open windows for the application
# defaults write NSGlobalDomain AppleSpacesSwitchOnActivate -bool true

# Group windows by application in Mission Control
defaults write com.apple.dock expose-group-by-app -bool false

# Displays have seperate Spaces
defaults write com.apple.spaces spans-displays -bool false

# Hot corners
#  0 : NOP
#  2 : Mission Control
#  3 : Show application windows
#  4 : Desktop
#  5 : Start screen saver
#  6 : Disable screen saver
#  7 : Dashboard
# 10 : Put display to sleep
# 11 : Launchpad
# 12 : Notification Center
# Top left screen corner → Show Application Windows
defaults write com.apple.dock wvous-tl-corner -int 3
defaults write com.apple.dock wvous-tl-modifier -int 0
# Top right screen corner → Mission Control
defaults write com.apple.dock wvous-tr-corner -int 2
defaults write com.apple.dock wvous-tr-modifier -int 0
# Bottom left screen corner → Start screen saver
defaults write com.apple.dock wvous-bl-corner -int 5
defaults write com.apple.dock wvous-bl-modifier -int 0
# Bottom right screen corner → Show desktop
defaults write com.apple.dock wvous-br-corner -int 4
defaults write com.apple.dock wvous-br-modifier -int 0

####################################################################
# Photos                                                           #
####################################################################
echo_warning "Applying photos settings"

# Prevent Photos from opening automatically when devices are plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

####################################################################
# Safari                                                           #
####################################################################
echo_warning "Applying safari settings"

# Start with all windows from last session
defaults write com.apple.Safari AlwaysRestoreSessionAtLaunch -bool true

# Set home page to `about:blank` for faster loading
defaults write com.apple.Safari HomePage -string 'about:blank'

# Save downloded files to
defaults write com.apple.Safari DownloadsPath -string '~/Downloads'

# Save format
# 0: Page Source
# 1: Web Archive
defaults write com.apple.Safari SavePanelFileFormat -int 0

# Remove downloads list items
# 0: Manually
# 1: When Safari Quits
# 2: Upon Successful Download
defaults write com.apple.Safari DownloadsClearingPolicy -int 1

# Prevent Safari from opening "safe" files automatically after downloading
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

# Open pages in tabs instead of windows:
# 0: Never
# 1: Automatically
# 2: Always
defaults write com.apple.Safari TabCreationPolicy -int 2

# Backspace key to go to the previous page in history
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool false

# Warn when visiting a fraudulent website
defaults write com.apple.Safari WarnAboutFraudulentWebsites -bool true

# Website use of location services:
# 0: Deny without prompting
# 1: Prompt for each website once each day
# 2: Prompt for each website one time only
defaults write com.apple.Safari SafariGeolocationPermissionPolicy -int 2

# Ask websites not to track me
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true

# Allow websites to check if Apple Pay is set up
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2ApplePayCapabilityDisclosureAllowed -bool true

# Show full URL
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

# Enable the Develop menu and the Web Inspector
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# Add a context menu item for showing the Web Inspector in web views
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# Add a context menu item for showing the Web Inspector in web views
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# Show status bar
defaults write com.apple.Safari ShowStatusBar -bool true

# Disable auto-playing video
defaults write com.apple.Safari WebKitMediaPlaybackAllowsInline -bool false
defaults write com.apple.SafariTechnologyPreview WebKitMediaPlaybackAllowsInline -bool false
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2AllowsInlineMediaPlayback -bool false
defaults write com.apple.SafariTechnologyPreview com.apple.Safari.ContentPageGroupIdentifier.WebKit2AllowsInlineMediaPlayback -bool false

####################################################################
# Security & Privacy                                               #
####################################################################
echo_warning "Applying security & privacy settings"

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Enable Secure Keyboard Entry in Terminal.app
# https://security.stackexchange.com/a/47786/8918
defaults write com.apple.terminal SecureKeyboardEntry -bool true

####################################################################
# Spotlight                                                        #
####################################################################
echo_warning "Applying spotlight settings"

# Change indexing order and disable some file types
defaults write com.apple.spotlight orderedItems -array \
  '{"enabled" = 1;"name" = "APPLICATIONS";}' \
  '{"enabled" = 1;"name" = "SYSTEM_PREFS";}' \
  '{"enabled" = 1;"name" = "DIRECTORIES";}' \
  '{"enabled" = 0;"name" = "PDF";}' \
  '{"enabled" = 0;"name" = "FONTS";}' \
  '{"enabled" = 0;"name" = "DOCUMENTS";}' \
  '{"enabled" = 0;"name" = "MESSAGES";}' \
  '{"enabled" = 0;"name" = "CONTACT";}' \
  '{"enabled" = 0;"name" = "EVENT_TODO";}' \
  '{"enabled" = 0;"name" = "IMAGES";}' \
  '{"enabled" = 0;"name" = "BOOKMARKS";}' \
  '{"enabled" = 0;"name" = "MUSIC";}' \
  '{"enabled" = 0;"name" = "MOVIES";}' \
  '{"enabled" = 0;"name" = "PRESENTATIONS";}' \
  '{"enabled" = 0;"name" = "SPREADSHEETS";}' \
  '{"enabled" = 0;"name" = "SOURCE";}'
# Load new settings before rebuilding the index
killall mds &>/dev/null
# Make sure indexing is enabled for the main volume
sudo mdutil -i on / > /dev/null
# Rebuild the index from scratch
sudo mdutil -E / > /dev/null

####################################################################
# Trackpad                                                         #
####################################################################
echo_warning "Applying trackpad settings"

# Tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Other trackpad gestures
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad DragLock -int 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Dragging -int 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFiveFingerPinchGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFourFingerHorizSwipeGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFourFingerPinchGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFourFingerVertSwipeGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadHandResting -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadHorizScroll -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadMomentumScroll -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadPinch -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRotate -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadScroll -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerHorizSwipeGesture -int 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerTapGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerVertSwipeGesture -int 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadTwoFingerDoubleTapGesture -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadTwoFingerFromRightEdgeSwipeGesture -int 3

# Force Click and haptic feedback
defaults write NSGlobalDomain com.apple.trackpad.forceClick -bool true
defaults write com.apple.AppleMultitouchTrackpad ForceSuppressed -bool false
defaults write com.apple.AppleMultitouchTrackpad ActuateDetents -bool true

# Silent clicking
defaults write com.apple.AppleMultitouchTrackpad ActuationStrength -int 0

# Haptic feedback
# 0: Light
# 1: Medium
# 2: Firm
defaults write com.apple.AppleMultitouchTrackpad FirstClickThreshold -int 0
defaults write com.apple.AppleMultitouchTrackpad SecondClickThreshold -int 0

# Tracking Speed
# 0: Slow
# 3: Fast
defaults write NSGlobalDomain com.apple.trackpad.scaling -float 3

####################################################################
# Users & Groups                                                   #
####################################################################
echo_warning "Applying users & groups settings"

# Disable guest account
sudo defaults write /Library/Preferences/com.apple.loginwindow GuestEnabled -bool false

# Show fast user switching menu as:
# 0 : Full Name
# 1 : Account Name
# 2 : Icon
defaults write NSGlobalDomain userMenuExtraStyle -int 2


# Show password hints after count (0 to disable)
defaults write NSGlobalDomain RetriesUntilHint -int 0