#!/bin/bash
# ---- Terminal & iTerm2 ---- #
print_step "Setting Terminal theme to Ayu Dark"
# Set the path to the Ayu Dark theme file relative to the script's location
terminalTheme="$script_dir/macos/themes/ayuDark.terminal"

# Import Ayu Dark theme to Terminal
open "$terminalTheme"

# Set Ayu Dark as default Terminal theme
defaults write com.apple.Terminal "Default Window Settings" -string "ayuDark"
defaults write com.apple.Terminal "Startup Window Settings" -string "ayuDark"

# iTerm2
# print_step "Setting iTerm2 theme to Ayu Dark"
# # Set the path to the Ayu Dark theme file relative to the script's location
# iTermTheme="$script_dir/themes/ayuDark.itermcolors"
# open "$iTermTheme"

# # Set Ayu Dark as default iTerm2 theme
# defaults write com.googlecode.iterm2 "Default Bookmark Guid" -string "$(grep -B1 "Ayu Dark" "$HOME/Library/Application Support/iTerm2/DynamicProfiles/88ED2C78-8DB9-4D81-B501-045E1A1415A5/com.googlecode.iterm2.plist" | head -n 1 | tr -d '\t')"

# print_success "iTerm2 theme has been set. Don't forget to import the profile JSON."

print_success "Done with Terminal Settings"

# iterm2
# 1. set as default - iTerm2 > make iTerm2 default term
# 2. settings > appearance > general > theme > minimal
# 3. profiles > default >
# text: cursor > underline & blinking
#       font: menlo 16
# window: transparency > 15, blur > 15
