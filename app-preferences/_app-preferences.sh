#!/usr/bin/env bash

echo "\033[34;7m applying app preferences \033[0m"

cd "$HOME/mac-setup/app-preferences"

# apply app preferences
app_preferences=(
    activity-monitor
    bartender
    contacts
    finder
		itunes
    mail
    messages
    photos
    plex
    safari
    terminal
    transmission
)

for file in "${app_preferences[@]}"; do
    source "./$file.sh"
done