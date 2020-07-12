##############
## HOMEBREW ##
##############
echo_warn "Installing Homebrew"
export HOMEBREW_CASK_OPTS="--appdir=/Applications --fontdir=/Library/Fonts"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew doctor

echo_warn "Installing apps etc. via Homebrew"

# brew packages
brew install mas dockutil mackup

# create mackup config file to use iCloud
echo -e "[storage]\nengine = icloud" > "./.mackup.cfg"

brew tap homebrew/cask-fonts

# quick look plugins & fonts
brew cask install \
    qlswift \
    qlimagesize \
    qlcolorcode \
    qlstephen \
    qlmarkdown \
    quicklook-json \
    quicklook-csv \
    webpquicklook \
    suspicious-package \
    betterzip \
    font-fira-mono-nerd-font

# apps
brew cask install \
    1password \
    atext \
    cheatsheet \
    daisydisk \
    dropbox \
    firefox \
    google-chrome \
    hazel \
    little-snitch \
#     lunar \
    monitorcontrol \
    openpht \
    plex-media-server \
    rectangle \
    slack \
    sourcetree \
    spotify \
    transmission \
    visual-studio-code \
    vlc

# mac app store apps
mas install 975937182   # fantastical
mas install 1284863847  # unsplash wallpapers
mas install 1449412482  # reeder
mas install 1176895641  # spark
mas install 497799835   # xcode

brew cleanup && brew cask cleanup
echo_ok "Done with Homebrew"
