#!/bin/bash
source "utils.sh"
# ---- Trackpad ---- #
# Tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Disable drag lock
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad DragLock -int 0

# Disable dragging
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Dragging -int 0

# Disable secondary click in the bottom-left corner
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 0

# Enable pinch with five fingers
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFiveFingerPinchGesture -int 2

# Enable horizontal swipe with four fingers
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFourFingerHorizSwipeGesture -int 2

# Enable pinch with four fingers
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFourFingerPinchGesture -int 2

# Enable vertical swipe with four fingers
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFourFingerVertSwipeGesture -int 2

# Enable resting detection
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadHandResting -int 1

# Enable horizontal scrolling
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadHorizScroll -int 1

# Enable momentum scrolling
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadMomentumScroll -int 1

# Enable pinch-to-zoom
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadPinch -int 1

# Enable secondary click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -int 1

# Enable rotate gesture
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRotate -int 1

# Enable vertical scrolling
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadScroll -int 1

# Enable drag with three fingers
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -int 1

# Disable horizontal swipe with three fingers
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerHorizSwipeGesture -int 0

# Enable tap with three fingers
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerTapGesture -int 2

# Disable vertical swipe with three fingers
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerVertSwipeGesture -int 0

# Enable double-tap with two fingers
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadTwoFingerDoubleTapGesture -int 1

# Disable swipe from right edge with two fingers
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadTwoFingerFromRightEdgeSwipeGesture -int 0

# Force Click and haptic feedback
defaults write NSGlobalDomain com.apple.trackpad.forceClick -bool true
defaults write com.apple.AppleMultitouchTrackpad ForceSuppressed -bool false
defaults write com.apple.AppleMultitouchTrackpad ActuateDetents -bool true

# Silent clicking
# defaults write com.apple.AppleMultitouchTrackpad ActuationStrength -int 0

# Haptic feedback
# 0: Light
# 1: Medium
# 2: Firm
defaults write com.apple.AppleMultitouchTrackpad FirstClickThreshold -int 2
defaults write com.apple.AppleMultitouchTrackpad SecondClickThreshold -int 2

# Tracking Speed
# 0: Slow
# 3: Fast
defaults write NSGlobalDomain com.apple.trackpad.scaling -float 3

print_success "Done with Trackpad Settings"
