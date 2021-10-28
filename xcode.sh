####################################################################
# Xcode Command Line Developer Tools                               #
####################################################################
# install xcode
function echo_ok { echo -e '\033[1;32m🔥 '"$1"'\033[0m'; }
echo_ok "Installing Command Line Developer Tools for Xcode, go do something else for 10 minutes..."
if ! $(xcode-select -p &>/dev/null); then
  xcode-select --install &>/dev/null

  # Wait until the Xcode Command Line Tools are installed
  until $(xcode-select -p &>/dev/null); do
    sleep 5
  done
fi

# accept xcode license
if ! $(sudo xcodebuild -license status); then
  sudo xcodebuild -license accept
fi

echo_ok "Done with xcode"