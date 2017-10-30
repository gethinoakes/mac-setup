#!/usr/bin/env bash

echo "\033[34;7m applying system preferences \033[0m"

cd "$HOME/setup/system-preferences"

# system-preferences
system_preferences=(
    general
    desktop-screensaver
    dock
    mission-control
    # language-region
    security-privacy
    spotlight
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
    source "./$file.sh"
done