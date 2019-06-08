# install xcode
echo_ok "Installing Xcode... go so something else for 10 minutes..."
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