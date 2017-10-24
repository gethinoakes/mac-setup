#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# system-preferences
system_preferences=(
    general
    desktop-screensaver
    dock
    mission-control
    language-region
    security-privacy
    spotlight
    notifications

    displays
    energy-saver
    keyboard
    mouse
    trackpad
    printers-scanners
    sound
    startup-disk

    icloud
    internet-accounts
    app-store
    network
    bluetooth
    extensions
    sharing

    users-groups
    parental-controls
    siri
    date-time
    time-machine
    accessibility
)

echo "\033[34;7m applying system preferences \033[0m"
for file in "${system_preferences[@]}"; do
    source "system-preferences/$file.sh"
done