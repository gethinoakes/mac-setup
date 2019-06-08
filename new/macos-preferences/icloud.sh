#!/usr/bin/env bash

echo "\033[34;7m applying system preferences: icloud \033[0m"

###############################################################################
# iCloud
###############################################################################

# Don't save to iCloud by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false