#!/usr/bin/env bash

###############################################################################
# Plex
###############################################################################

# Plex auto-delete
rsync -r "$HOME/Library/Mobile Documents/com~apple~CloudDocs/setup/apps/.plex-autodelete.yml" "${HOME}"