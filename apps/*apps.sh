#!/usr/bin/env bash

echo "\033[34;7m installing apps \033[0m"

cd "$HOME/setup/apps"

# first install apps and system dependencies
apps=(
    xcode
    homebrew
    node
    google-fonts
)

echo "\033[34;7m installing apps \033[0m"
for file in "${apps[@]}"; do
    source "./$file.sh"
done
