#!/usr/bin/env bash

#######################################
### macOS setup for a fresh install ###
#######################################
# 1. xcode and apps
# 2.

function echo_ok { echo -e '\033[1;32m'"$1"'\033[0m'; }
function echo_warn { echo -e '\033[1;33m'"$1"'\033[0m'; }
function echo_error  { echo -e '\033[1;31mERROR: '"$1"'\033[0m'; }

echo_ok "Setting up your Mac... You will be asked for your password (for sudo)."

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# apps
echo_ok "Installing apps and dependencies"
# source 1-apps.sh

###########
## XCODE ##
###########
# install xcode
echo_warn "Installing Xcode... go do something else for 10 minutes..."
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

##############
## HOMEBREW ##
##############
export HOMEBREW_CASK_OPTS="--appdir=/Applications --fontdir=/Library/Fonts"

if hash brew &> /dev/null; then
	echo_ok "Homebrew already installed"
else
  echo_warn "Installing homebrew..."
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew doctor && brew update && brew upgrade

echo_ok "Installing apps etc. via Homebrew"

# taps
echo_warn "Installing homebrew taps"
brew tap homebrew/bundle
brew tap homebrew/core
brew tap caskroom/cask
brew tap caskroom/fonts
brew tap caskroom/versions

# dependencies
echo_warn "Installing utils & dependencies"
brew install mas dockutil mackup

# shells
echo_warn "Installing shells"
brew install zsh zsh-completions

# quicklook plugins
echo_warn "Installing quicklook plugins"
brew cask install \
qlplayground qlswift qlcolorcode \
quicklook-csv quicklook-json qlstephen \
qlmarkdown qlimagesize qlvideo epubquicklook

# fonts
echo_warn "Installing fonts"
brew cask install font-montserrat font-open-sans font-pacifico font-lato
# powerline fonts for zsh
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts

# development
echo_warn "Installing dev stuff"
brew install "node"
brew cask install "ngrok"

# apps
echo_warn "Installing apps"
brew cask install 1password atext authy cheatsheet dash \
dropbox firefox google-chrome hazel \
little-snitch macdropany openpht plex-media-server \
rocket setapp sketch slack \
sourcetree spotify telegram-desktop the-unarchiver \
transmission visual-studio-code vlc
# alfred \
# bartender \
# catch \
# franz \
# lunar \
# unlox \
# podcastmenu \
# spotifree \
# textexpander \
# tunnelblick \
# tweeten \

# install mac app store apps
echo_warn "Installing mac app store apps"
mas install 417375580 # bettersnaptool
# mas install 411643860 # daisydisk
# mas install 880001334 # reeder
mas install 1176895641 # spark
# mas install 497799835 # xcode

# cleanup
echo_warn "Cleaning up homebrew installs..."
brew cleanup && brew cask cleanup
echo_ok "Done with Homebrew"

###################
## NODE PACKAGES ##
###################
# Node and yarn *should* be installed at this point
hash node 2>/dev/null || echo_error "Please install node before continuing"
hash npm 2>/dev/null || echo_error "Please install npm before continuing"

# Update npm
npm update -g npm

# Install Node packages
node_packages=(
  '@angular/cli'
  typescript
  prettier
  gulp
  # a11y
  # lighthouse
  # psi
  # stylelint
  svgo
)

# Loop through each package individally because
# any errors will stop all installations
echo_warn "Installing node packages"
for package in "${node_packages[@]}"; do
  npm install -g "$package"
done

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

##################
## GOOGLE FONTS ##
##################
echo_warn "Installing google fonts"
GOOGLE_FONTS_DIR='/Library/Fonts/Google Fonts'
mkdir -p "$GOOGLE_FONTS_DIR"
if [ ! -d "$GOOGLE_FONTS_DIR"/.git ]; then
  git clone --depth 1 https://github.com/google/fonts.git "$GOOGLE_FONTS_DIR"
fi

# Schedule Google Fonts Updates
read -d '' cron_entry <<-EOF
0 */6 * * * sh -c 'cd "${GOOGLE_FONTS_DIR}" && git fetch -fp --depth 1 && \
git reset --hard @{upstream} && git clean -dfx' &>/dev/null
EOF
if ! crontab -l | fgrep "$cron_entry" >/dev/null; then
  (crontab -l 2>/dev/null; echo "$cron_entry") | \
    crontab -
fi

#####################
## APP PREFERENCES ##
#####################
echo_warn "Applying app preferences"
app_preferences=(
    activity-monitor
    # bartender
    contacts
    finder
    itunes
    mail
    messages
    photos
    # plex
    safari
    # terminal
    transmission
)

for file in "${app_preferences[@]}"; do
    source "$HOME/Development/mac-setup/new/app-preferences/$file.sh"
done
echo_ok "Done applying app preferences"

#######################
## MACOS PREFERENCES ##
#######################
echo_warn "Applying macOS preferences"
system_preferences=(
    general
    desktop-screensaver
    dock
    mission-control
    launchpad
    # language-region
    security-privacy
    # spotlight
    notifications

    # displays
    # energy-saver
    keyboard
    # mouse
    trackpad
    printers-scanners
    sound
    # startup-disk

    icloud
    # internet-accounts
    app-store
    # network
    bluetooth
    # extensions
    # sharing

    users-groups
    # parental-controls
    siri
    date-time
    time-machine
    accessibility

    # miscellaneous settings
    misc
)

for file in "${system_preferences[@]}"; do
    source "$HOME/Development/mac-setup/new/macos-preferences/$file.sh"
done
echo_ok "Done applying macOS preferences"


##### FINISHED!
echo_ok "All finished! Note that some of these changes require a logout/restart to take effect."
chsh -s zsh
read -p "Would you like to restart the computer now? [Y/n] " -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    osascript -e 'tell app "System Events" to restart'
fi
