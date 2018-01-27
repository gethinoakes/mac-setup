#!/usr/bin/env bash

###############################################################################
# Node
###############################################################################

# Node and yarn *should* be installed at this point
hash node 2>/dev/null || echo "Please install node before continuing"
hash npm 2>/dev/null || echo "Please install npm before continuing"

# Update npm
npm update -g npm

# Install Node packages
node_packages=(
  '@angular/cli'
  typescript
  a11y
  lighthouse
  psi
  snapline
  stylelint
)

# Loop through each package individally because
# any errors will stop all installations
echo "\033[34;7m installing node packages \033[0m"
for package in "${node_packages[@]}"; do
  npm install -g "$package"
done