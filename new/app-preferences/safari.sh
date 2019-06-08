#!/usr/bin/env bash

###############################################################################
# Safari & WebKit
###############################################################################

# General
###############################################################################

# Start with all windows from last session
defaults write com.apple.Safari AlwaysRestoreSessionAtLaunch -bool true

# Setup new window and tab behvior
# 0: Homepage
# 1: Empty Page
# 2: Same Page
# 3: Bookmarks
# 4: Top Sites
defaults write com.apple.Safari NewTabBehavior -int 1
defaults write com.apple.Safari NewWindowBehavior -int 1

# Set home page to `about:blank` for faster loading
defaults write com.apple.Safari HomePage -string 'about:blank'

# Remove history items (in days)
defaults write com.apple.Safari HistoryAgeInDaysLimit -int 31

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
defaults write com.apple.Safari DownloadsClearingPolicy -int 2

# Prevent Safari from opening "safe" files automatically after downloading
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

# Tabs
###############################################################################

# Open pages in tabs instead of windows:
# 0: Never
# 1: Automatically
# 2: Always
defaults write com.apple.Safari TabCreationPolicy -int 2

# Search
###############################################################################

# Include search engine suggestions
defaults write com.apple.Safari SuppressSearchSuggestions -bool false

# Include Spotlight Suggestions
defaults write com.apple.Safari UniversalSearchEnabled -bool true

# Show Favorites under Smart Search field
defaults write com.apple.Safari ShowFavoritesUnderSmartSearchField -bool false

# Enable Quick Website Search
defaults write com.apple.Safari WebsiteSpecificSearchEnabled -bool true

# Preload Top Hit in the background
defaults write com.apple.Safari PreloadTopHit -bool false

# Backspace key to go to the previous page in history
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool false

# Security
###############################################################################

# Warn when visiting a fraudulent website
defaults write com.apple.Safari WarnAboutFraudulentWebsites -bool true

# Privacy
###############################################################################

# Cookies and website data:
# 0,2: Alwasy block
# 3,1: Allow from current website only
# 2,1: Allow from websites I visit
# 1,0: Alwasy allow
defaults write com.apple.Safari BlockStoragePolicy -int 2
defaults write com.apple.Safari WebKitStorageBlockingPolicy -int 1
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2StorageBlockingPolicy -int 1

# Website use of location services:
# 0: Deny without prompting
# 1: Prompt for each website once each day
# 2: Prompt for each website one time only
defaults write com.apple.Safari SafariGeolocationPermissionPolicy -int 2

# Ask websites not to track me
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true

# Allow websites to check if Apple Pay is set up
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2ApplePayCapabilityDisclosureAllowed -bool true

# Extensions
###############################################################################

# Enable extensions
defaults write com.apple.Safari ExtensionsEnabled -bool true

# Advanced
###############################################################################

# Show full URL
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

# Press Tab to highlight each item on a webpage
defaults write com.apple.Safari WebKitTabToLinksPreferenceKey -bool true

# Save article for offline reading automatically
defaults write com.apple.Safari ReadingListSaveArticlesOfflineAutomatically -bool true

# Stop internet plug-ins to save power
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2PlugInSnapshottingEnabled -bool true

# Set default encoding
defaults write com.apple.Safari WebKitDefaultTextEncodingName -string 'utf-8'
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DefaultTextEncodingName -string 'utf-8'

# Enable the Develop menu and the Web Inspector
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# Add a context menu item for showing the Web Inspector in web views
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# Miscellaneous
###############################################################################

# Show bookmarks bar
defaults write com.apple.Safari ShowFavoritesBar-v2 -bool false

# Search with Contains instead of Starts With
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

# Remove useless icons from Safari’s bookmarks bar
defaults write com.apple.Safari ProxiesInBookmarksBar '()'

# Add a context menu item for showing the Web Inspector in web views
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# Set tab bar visibility
defaults write com.apple.Safari AlwaysShowTabBar -bool false

# Show status bar
defaults write com.apple.Safari ShowStatusBar -bool true

# Disable auto-playing video
defaults write com.apple.Safari WebKitMediaPlaybackAllowsInline -bool false
defaults write com.apple.SafariTechnologyPreview WebKitMediaPlaybackAllowsInline -bool false
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2AllowsInlineMediaPlayback -bool false
defaults write com.apple.SafariTechnologyPreview com.apple.Safari.ContentPageGroupIdentifier.WebKit2AllowsInlineMediaPlayback -bool false

# Disable Webkit Nightly start page
defaults write org.webkit.nightly.WebKit StartPageDisabled -bool true

# Always show toolbar in full screen
defaults write com.apple.Safari AutoShowToolbarInFullScreen -bool false

# Open Bookmarks Group in tabs
defaults write com.apple.Safari NSUserKeyEquivalents -dict-add '\033Bookmarks\033Work\033Open in New Tabs' '@$g'

# Print
################################################################################

# Print headers and footers
defaults write com.apple.Safari PrintHeadersAndFooters -bool false

# Print backgrounds
defaults write com.apple.Safari WebKitShouldPrintBackgroundsPreferenceKey -bool false
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2ShouldPrintBackgrounds" -bool false