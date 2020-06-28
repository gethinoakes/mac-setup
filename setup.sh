function echo_ok { echo -e '\033[1;32m'"$1"'\033[0m'; }
function echo_warn { echo -e '\033[1;33m'"$1"'\033[0m'; }
function echo_error  { echo -e '\033[1;31mERROR: '"$1"'\033[0m'; }

echo_ok "Setting up your Mac... You will be asked for your password (for sudo)."
echo_warn "Make sure you have downloaded Mackup folder first"

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# run first time setup things if needed
read -p "Is this first run? (not an additional user account) [y/n]" -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  source "$HOME/mac-setup/first-run/_first-run.sh"      # xcode-cldt, homebrew & node
fi
source "$HOME/mac-setup/app-prefs/_app-prefs.sh"        # app preferences
source "$HOME/mac-setup/macos-prefs/_macos-prefs.sh"    # macos preferences
mackup restore

# FINISHED!
echo_ok "All finished! Note that some of these changes require a logout/restart to take effect."
read -p "Would you like to restart the computer now? [Y/n] " -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    osascript -e 'tell app "System Events" to restart'
fi