##########
## NODE ##
##########
echo_warn "Installing node & global packages"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash
nvm install node
nvm use node

node_packages=(
  '@angular/cli'
  typescript
  prettier
  gulp
  stylelint
)

# Loop through each package individally because
# any errors will stop all installations
# echo_warn "Installing node packages"
for package in "${node_packages[@]}"; do
   npm i -g "$package"
done

echo_ok "Done with node"
