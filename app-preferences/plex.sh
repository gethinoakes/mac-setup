#!/usr/bin/env bash

###############################################################################
# Plex
###############################################################################

# Plex auto-delete
rsync -r "$HOME/setup/apps/.plex-autodelete.yml" "${HOME}"