#!/bin/bash
# set -e

####################
# Source utility and function files
####################
source "utils.sh"
source "functions.sh"

####################
# Main Script
####################
print_welcome_message

check_internet_connection

ask_for_sudo

install_xcode_clt

install_nvm

install_homebrew

install_homebrew_packages

install_fonts

install_quicklook_plugins

install_apps

install_mac_app_store_apps

update_homebrew_formulae

clean_homebrew_files

install_dockutil

install_npm_packages

set_git_config

set_macos_settings

print_completion_message

ask_for_restart
