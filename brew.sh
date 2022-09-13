function echo_ok { echo -e '\033[1;32m🔥 '"$1"'\033[0m'; }

echo_ok "Installing Homebrew"
export HOMEBREW_CASK_OPTS="--appdir=/Applications --fontdir=/Library/Fonts"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

echo_ok "Installing Powerlevel10k theme"
brew install romkatv/powerlevel10k/powerlevel10k
echo "source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme" >>~/.zshrc

echo_ok "Installing Homebrew packages"
# brew packages
brew install mas
brew install dockutil

echo_ok "Installing quicklook plugins"
brew install --cask \
  qlcolorcode \
  qlimagesize \
  qlmarkdown \
  qlstephen \
  qlswift \
  quicklook-csv \
  quicklook-json

echo_ok "Installing apps"
brew install --cask \
  1password \
  atext \
  boop \
  cheatsheet \
  daisydisk \
  dropbox \
  firefox \
  google-chrome \
  hazel \
  # little-snitch \
  # lunar \
  monitorcontrol \
  raycast \
  setapp \
  sketch \
  slack \
  spotify \
  transmission \
  visual-studio-code \
  vlc

echo_ok "Installing mac app store apps"
# mac app store apps
mas install 417375580   # bettersnaptool
mas install 975937182   # fantastical
mas install 639968404   # parcel
# mas install 1529448980  # reeder
mas install 1176895641  # spark
mas install 1284863847  # unsplash wallpapers
mas install 497799835   # xcode

brew cleanup && brew cask cleanup
echo_ok "Done with Homebrew"