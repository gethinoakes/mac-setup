function echo_ok { echo -e '\033[1;32m🔥 '"$1"'\033[0m'; }
function echo_warning { echo -e '\033[1;33m⚠️ '" $1"'\033[0m'; }

echo_ok "Setting up your Mac... You will be asked for your password (for sudo)."
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

source "$HOME/mac-setup/brew.sh"
source "$HOME/mac-setup/node.sh"
source "$HOME/mac-setup/git.sh"
source "$HOME/mac-setup/macos.sh"
source "$HOME/mac-setup/xcode.sh"

# FINISHED!
echo_ok "All finished! Note that some of these changes require a logout/restart to take effect."
read -p "Would you like to restart the computer now? [Y/n] " -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    osascript -e 'tell app "System Events" to restart'
fi