#!/bin/bash
source "utils.sh"
# ---- Keyboard Shortcuts ---- #
# ---- Spotlight ---- #
print_step "Disable Cmd+Spacebar shortcut for Spotlight"
defaults write -g NSUserKeyEquivalents '{"Show Spotlight Search"="";}'

# ---- Screenshots ---- #
print_step "Disable screenshot shortcuts"
# Disable Cmd+Shift+3 shortcut for full screen screenshot
defaults write com.apple.screencapture "disable-cmd-shift-3" -bool true

# Disable Cmd+Shift+4 shortcut for partial screenshot
defaults write com.apple.screencapture "disable-cmd-shift-4" -bool true

# Disable Cmd+Shift+5 shortcut for screen recording
defaults write com.apple.screencapture "disable-cmd-shift-5" -bool true

# Disable Cmd+Control+Shift+3 shortcut for full screen screenshot to clipboard
defaults write com.apple.screencapture "copy-to-clipboard" -bool false

# Disable Cmd+Control+Shift+4 shortcut for partial screenshot to clipboard
defaults write com.apple.screencapture "disable-shadow" -bool true

# ---- Ctrl+right/left space switching ---- #
# Disable Ctrl+Right arrow shortcut for switching to the space on the right
# defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 70 '<dict><key>enabled</key><false/></dict>'
# defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 71 '<dict><key>enabled</key><false/></dict>'

# Disable Ctrl+Left arrow shortcut for switching to the space on the left
# defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 71 '<dict><key>enabled</key><false/></dict>'

defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 70 "{enabled = 0;}"
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 71 "{enabled = 0;}"

# ---- Home/End keys ---- #
# print_step "Disable Home and End keys completely!"
# Map Home key to do nothing
# hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x70000006C,"HIDKeyboardModifierMappingDst":0xFFFF}]}'

# Map End key to do nothing
# hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x70000005e,"HIDKeyboardModifierMappingDst":0x700000000}]}'

print_success "Done with KeyBoard Shortcuts Settings"
