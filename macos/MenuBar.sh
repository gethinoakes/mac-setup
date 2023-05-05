#!/bin/bash
source "utils.sh"
# ---- Menu Bar ---- #

# Clock
# - FlashDateSeparators = true/false
# - IsAnalog = true/false
# - ShowAMPM = true/false
# - Show24Hour = true/false
# - ShowDate = true/false
# - ShowDayOfWeek = true/false
# - ShowSeconds = true/false
print_step "Applying Menu Bar Clock Settings"
defaults write com.apple.menuextra.clock "FlashDateSeparators" -bool false
defaults write com.apple.menuextra.clock "IsAnalog" -bool true
defaults write com.apple.menuextra.clock "ShowAMPM" -bool false
defaults write com.apple.menuextra.clock "Show24Hour" -bool true
defaults write com.apple.menuextra.clock "ShowDate" -bool false
defaults write com.apple.menuextra.clock "ShowDayOfWeek" -bool false
defaults write com.apple.menuextra.clock "ShowSeconds" -bool false

print_step "Hide/Show Specific Menu Bar Icons"
defaults write com.apple.Spotlight menuBarShown -bool false
defaults write com.apple.Siri StatusMenuVisible -bool false

# Show Wi-Fi icon
defaults write com.apple.systemuiserver menuExtras -array-add "/System/Library/CoreServices/Menu Extras/AirPort.menu"

# Show Bluetooth icon
defaults write com.apple.systemuiserver menuExtras -array-add "/System/Library/CoreServices/Menu Extras/Bluetooth.menu"

# Hide AirDrop icon
defaults write com.apple.controlcenter "NSStatusItem Visible com.apple.controlcenter.airdrop" -bool false

# Hide Focus icon
defaults write com.apple.controlcenter "NSStatusItem Visible com.apple.controlcenter.focus" -bool false

# Hide Stage Manager icon
defaults write com.apple.controlcenter "NSStatusItem Visible com.apple.controlcenter.stage-manager" -bool false

# Show Screen Mirroring icon when active
defaults write com.apple.controlcenter "NSStatusItem Visible com.apple.controlcenter.airplay-display" -bool false

# Show Display icon when active
defaults write com.apple.controlcenter "NSStatusItem Visible com.apple.controlcenter.display" -bool false

# Always show Sound icon
defaults write com.apple.controlcenter "NSStatusItem Visible com.apple.controlcenter.sound" -bool false

# Hide Now Playing icon
defaults write com.apple.controlcenter "NSStatusItem Visible com.apple.controlcenter.media-controls.now-playing" -bool false

# Show Time Machine icon
defaults write com.apple.systemuiserver menuExtras -array-add "/System/Library/CoreServices/Menu Extras/TimeMachine.menu"

# Menu bar: show remaining battery time (on pre-10.8); hide percentage
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# Show Fast User Switcher in Menu Bar (use -int 9 = in CC)
defaults write com.apple.controlcenter "UserSwitcher" -int 6
defaults write com.apple.controlcenter "NSStatusItem Visible UserSwitcher" -int 1

print_success "Done with Menu Bar Settings"
