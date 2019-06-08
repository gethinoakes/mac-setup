#!/usr/bin/env bash

###############################################################################
# Homebrew
###############################################################################

echo "\033[34;7m installing homebrew \033[0m"

# Install Homebrew if not installed - brew.sh
if ! hash brew 2>/dev/null; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Schedule Homebrew Updates
cron_entry='0 */6 * * * /usr/local/bin/brew update &>/dev/null'
if ! crontab -l | fgrep "$cron_entry" >/dev/null; then
  (crontab -l 2>/dev/null; echo "$cron_entry") | \
    crontab -
fi

# Install Homebrew Bundle
brew tap Homebrew/bundle

# Make sure we are using the latest Homebrew
brew update

# Upgrade existing packages
brew upgrade

# Install CLI tools & GUI applications
echo "\033[34;7m installing apps etc. via homebrew... \033[0m"
brew bundle --file="${HOME}/Development/mac-setup/apps/Brewfile"

# Remove outdated versions from the cellar
brew cleanup && brew prune

# Remove outdated cask versions from the cellar
brew cask cleanup
