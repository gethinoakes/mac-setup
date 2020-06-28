###########
## XCODE ##
###########
# install xcode
echo_warn "Installing Command Line Developer Tools for Xcode, go do something else for 10 minutes..."
if ! $(xcode-select -p &>/dev/null); then
  xcode-select --install &>/dev/null

  # Wait until the Xcode Command Line Tools are installed
  until $(xcode-select -p &>/dev/null); do
    sleep 5
  done
fi

if ! $(sudo xcodebuild -license status); then
  sudo xcodebuild -license accept
fi

echo_ok "Done with xcode"