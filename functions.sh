#!/bin/bash
# Functions for installing dependencies, packages, fonts, etc.

install_xcode_clt() {
  print_title "Installing Dependencies…"

  # XCODE
  # Check if Xcode Command Line Tools are installed
  if ! xcode-select -p &>/dev/null; then
    print_step "Installing Xcode Command Line Tools..."
    xcode-select --install

    # Wait for the user to complete the installation
    until xcode-select -p &>/dev/null; do
      sleep 5
    done

    print_success "Xcode Command Line Tools installed."
  else
    print_success_muted "Xcode Command Line Tools already installed."
  fi

  # Check if the Xcode license has been accepted
  if ! sudo xcodebuild -license check &>/dev/null; then
    print_step "Accepting Xcode license agreement..."
    sudo xcodebuild -license accept
    print_success "Xcode license agreement accepted."
  else
    print_success_muted "Xcode license agreement already accepted."
  fi
}

install_oh_my_zsh() {
  print_title "Installing Oh My Zsh..."
  # Check if Oh My Zsh is installed
  if [ -d "$HOME/.oh-my-zsh" ]; then
    print_success_muted "Oh My Zsh already installed."
  else
    print_step "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    echo "Oh My Zsh installed."

    # Install zsh-nvm plugin
    # print_step "Installing zsh-nvm plugin..."
    # git clone https://github.com/lukechilds/zsh-nvm.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-nvm"
    # echo "zsh-nvm plugin installed."

    # Install zsh-autosuggestions plugin
    print_step "Installing zsh-autosuggestions plugin..."
    git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
    echo "zsh-autosuggestions plugin installed."

    # Install zsh-syntax-highlighting plugin
    print_step "Installing zsh-syntax-highlighting plugin..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
    echo "zsh-syntax-highlighting plugin installed."

    # Add plugins to .zshrc file
    print_step "Adding plugins to .zshrc file..."
    sed -i.bak 's/^plugins=(\(.*\))/plugins=(\1 zsh-autosuggestions zsh-syntax-highlighting)/' "$HOME/.zshrc"
    echo "Plugins added to .zshrc file. A backup of the original .zshrc file has been created as .zshrc.bak."

    # Restart Zsh to apply changes
    print_step "Restarting Zsh to apply changes..."
    exec zsh
  fi
}

install_nvm() {
  print_title "Installing NVM..."
  # Check if nvm is installed
  if [ ! -f "$HOME/.nvm/nvm.sh" ]; then
    print_step "Installing NVM..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

    # Source nvm.sh to make nvm available in the current shell session
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

    print_step "Installing the latest Node.js version..."
    nvm install --lts
    nvm use --lts
    nvm alias default 'lts/*'
    nodev=$(node -v)
    print_success "NVM/Node installed (version: $nodev)."
  else
    print_success_muted "NVM/Node already installed (version: $nodev)."
  fi
}

install_homebrew() {
  print_title "Installing Homebrew..."
  # check if Homebrew is installed
  if ! command -v brew &>/dev/null; then
    export HOMEBREW_CASK_OPTS="--appdir=/Applications --fontdir=/Library/Fonts"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # Add Homebrew to the PATH in .zprofile
    echo -e '\neval "$(/opt/homebrew/bin/brew shellenv)"' >>"$HOME/.zprofile"
    # Evaluate Homebrew shell environment for the current session
    eval "$(/opt/homebrew/bin/brew shellenv)"

    print_success "Homebrew installed."
  else
    print_success_muted "Homebrew already installed."
  fi
}

install_homebrew_packages() {
  if [ -e $script_dir/setup/packages ]; then
    print_title "Installing Homebrew Packages..."
    while IFS= read -r package || [ -n "$package" ]; do
      [[ $package =~ ^#.* ]] && continue # Ignore comments

      if ! brew list --formula | grep -q "^${package}\$"; then
        print_step "Installing $package"
        brew install --quiet "$package"
        print_step_green "Installed $package"
      else
        print_success_muted "Skipping $package (already installed)"
      fi
    done <setup/packages
    print_success "Packages installed."
  fi
}

install_fonts() {
  if [ -e $script_dir/setup/fonts ]; then
    print_title "Installing Fonts with Homebrew..."
    brew tap homebrew/cask-fonts
    while IFS= read -r font || [ -n "$font" ]; do
      [[ $font =~ ^#.* ]] && continue # Ignore comments

      if ! brew list --cask | grep -q "^${font}\$"; then
        print_step "Installing $font"
        brew install --quiet --cask --fontdir=/Library/Fonts "$font"
        print_step_green "Installed $font"
      else
        print_success_muted "Skipping $font (already installed)"
      fi
    done <setup/fonts
    print_success "Fonts installed."
  fi
}

install_quicklook_plugins() {
  if [ -e $script_dir/setup/ql-plugins ]; then
    print_title "Installing Quick Look Plugins with Homebrew..."
    while IFS= read -r qlPlugin || [ -n "$qlPlugin" ]; do
      [[ $qlPlugin =~ ^#.* ]] && continue # Ignore comments

      if ! brew list --cask | grep -q "^${qlPlugin}\$"; then
        print_step "Installing $qlPlugin"
        brew install --quiet --cask "$qlPlugin"
        print_step_green "Installed $qlPlugin"
      else
        print_success_muted "Skipping $qlPlugin (already installed)"
      fi
    done <setup/ql-plugins
    print_success "Quick Look plugins installed."
  fi
}

install_apps() {
  if [ -e $script_dir/setup/apps ]; then
    print_title "Installing Apps with Homebrew..."
    while IFS= read -r app || [ -n "$app" ]; do
      [[ $app =~ ^#.* ]] && continue # Ignore comments

      if ! brew list --cask | grep -q "^${app}\$"; then
        print_step "Installing $app"
        brew install --quiet --cask "$app"
        print_step_green "Installed $app"
      else
        print_success_muted "Skipping $app (already installed)"
      fi
    done <setup/apps
    print_success "Apps installed."
  fi
}

install_mac_app_store_apps() {
  # Check if mas is installed
  if [ -e $script_dir/setup/mas-apps ]; then
    if ! command -v mas >/dev/null 2>&1; then
      print_warning "mas is not installed. Install it using 'brew install --quiet mas' and try again."
    else
      # Ask the user to confirm they are signed into the Mac App Store
      read -n 1 -p "Are you signed in to the Mac App Store? (y/n): " answer
      echo
      if [[ "$answer" =~ ^[Yy]$ ]]; then
        print_warning "Please sign in to the Mac App Store and run the script again."
      else
        while IFS= read -r line || [ -n "$line" ]; do
          [[ $line =~ ^#.* ]] && continue # Ignore comments

          # Extract the app ID before the colon
          IFS=":" read -r app_id app_name <<<"$line"

          if ! mas list | grep -q "^${app_id}"; then
            print_step "Installing $app_name"
            mas install "$app_id"
            print_step_green "Installed $app_name"
          else
            print_success_muted "Skipping $app_name (already installed)"
          fi
        done <setup/mas-apps
      fi
    fi
  fi
}

update_homebrew_formulae() {
  print_title "Updating Homebrew formulae…"
  brew update
  print_success "Homebrew updated."
}

clean_homebrew_files() {
  print_title "Cleaning up Homebrew files…"
  brew cleanup 2>/dev/null
  print_success "Homebrew cleanup finished."
}

install_dockutil() {
  print_title "Installing Dockutil..."

  # Check if dockutil is installed and exit if it is
  if [ -x "$(command -v dockutil)" ]; then
    current_version=$(dockutil --version)
    print_success_muted "dockutil $current_version is already installed."
  else
    # Download dockutil pkg from GitHub
    curl -o /tmp/dockutil.pkg --silent --location "https://github.com/kcrawford/dockutil/releases/download/3.0.2/dockutil-3.0.2.pkg"

    # Install dockutil silently
    sudo installer -pkg /tmp/dockutil.pkg -target /

    # Remove downloaded pkg file
    rm -f /tmp/dockutil.pkg

    # Test that dockutil is working
    dockutil --version
    print_success "Dockutil installed."
  fi
}

install_npm_packages() {
  print_title "Installing NPM Packages…"
  if [ -e $script_dir/setup/npm ]; then
    while IFS= read -r package || [ -n "$package" ]; do
      [[ $package =~ ^#.* ]] && continue # Ignore comments
      if npm list -g | grep $package >/dev/null; then
        print_success_muted "$package already installed. Skipped."
      else
        print_step "Installing $package"
        npm i -g "$package" --silent
        print_step_green "Installed $package"
      fi
    done <setup/npm
    print_success "NPM packages installed."
  fi
}

set_git_config() {
  print_title "Setting Global GIT Config…"
  git config --global user.name "Gethin"
  git config --global user.email "github@gethin.dev"
  print_success "Git Config Set."
}

set_macos_settings() {
  read -n 1 -p "Do you want to configure macOS settings? (y/n): " answer
  echo

  if [[ "$answer" =~ ^[Yy]$ ]]; then
    # Close any open System Preferences panes, to prevent them from overriding settings we’re about to change
    osascript -e 'tell application "System Preferences" to quit'

    mkdir "$HOME/Development"

    # Loop over all .sh files in the macos/ directory and run them
    for file in macos/*.sh; do
      print_title "Running $file..."
      source "$file"
    done

  fi
}

# Function to install Powerlevel10k theme for Oh My Zsh
install_powerlevel10k_theme() {
  read -n 1 -p "Do you want to install the powerlevel10k oh my zsh theme now? (y/n): " answer
  echo

  if [[ "$answer" =~ ^[Yy]$ ]]; then
    print_title "Checking and installing Powerlevel10k theme for Oh My Zsh..."

    # Check if Powerlevel10k theme is already installed
    if [ -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
      print_success_muted "Powerlevel10k theme is already installed."
    else
      # Clone the Powerlevel10k theme repository
      git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
      print_success "Powerlevel10k theme installed."
    fi

    # Check if Powerlevel10k theme is in use in .zshrc
    if grep -q '^ZSH_THEME="powerlevel10k/powerlevel10k"' ~/.zshrc; then
      print_success_muted "Powerlevel10k theme is already in use."
    else
      # Update the .zshrc file to use the Powerlevel10k theme
      sed -i.bak 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc

      # Remove the backup .zshrc file created by sed
      rm ~/.zshrc.bak

      print_success "Powerlevel10k theme configured in .zshrc."
    fi
  else
    print_warning "Powerlevel10k theme aborted. Don't forget to do it later!"
  fi
}

ask_for_restart() {
  read -n 1 -p "Do you want to restart the computer now (some changes may require it)? (y/n): " answer
  echo
  if [[ "$answer" =~ ^[Yy]$ ]]; then
    sudo reboot
  else
    print_warning "Restart aborted. Please restart your computer manually for some of the changes to take effect."
  fi
}
