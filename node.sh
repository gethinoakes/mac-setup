function echo_ok { echo -e '\033[1;32m'"$1"'\033[0m'; }

nvm install --lts
nvm use --lts

node_packages=(
  '@angular/cli'
  typescript
  prettier
  gulp
  stylelint
  standard-version
  webpack-bundle-analyzer
  eslint
)

# Loop through each package individally because
# any errors will stop all installations
# echo_warn "Installing node packages"
for package in "${node_packages[@]}"; do
   npm i -g "$package"
done

echo_ok "Done with node"
