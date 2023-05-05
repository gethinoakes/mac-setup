# Define color and format codes
COUNT=1
RESET="\033[0m"
BOLD="\033[1m"
UNDERLINE="\033[4m"
RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
BLUE="\033[34m"
DIM="\033[2m"

# Get full directory name of this script
script_dir="$(cd "$(dirname "$0")" && pwd)"

# Utility functions
# These functions are used to print messages with different styles and colors.

# Print title with a counter
print_title() {
  local text="$1"
  echo "\n\n${BOLD}$((COUNT++)): ${text}${RESET}\n└────────────────────────────────────────────────────"
}

print_step() {
  local text="$1"
  echo "${UNDERLINE}‣ ${text}${RESET}"
}

print_step_green() {
  local text="$1"
  echo "${GREEN}${UNDERLINE}‣ ${text}${RESET}"
}

print_success() {
  local text="$1"
  echo "${GREEN}${BOLD}✅ ${text}${RESET}"
}

print_success_muted() {
  local text="$1"
  echo "${DIM}☑️  ${text}${RESET}"
}

print_warning() {
  local text="$1"
  echo "${YELLOW}${BOLD}⚠️  ${text}${RESET}"
}

print_error() {
  local text="$1"
  echo "${RED}${BOLD}❌ ${text}${RESET}"
}

print_welcome_message() {
  printf "
╭───────────────────────────────────────────────────╮
│  Safe to run multiple times on the same machine.  │
│  It ${GREEN}${BOLD}installs${RESET}, ${BLUE}${BOLD}upgrades${RESET}, or ${YELLOW}${BOLD}skips${RESET} packages based   │
│  on what is already installed on the machine.     │
│  ${UNDERLINE}It also applies macOS system preferences.${RESET}        │
╰───────────────────────────────────────────────────╯
  "
}

print_completion_message() {
  printf "
╭───────────────────────────────────────────────────╮
│                    ${GREEN}${BOLD}All done${RESET} 🎉                    │
╰───────────────────────────────────────────────────╯
  "
}

check_internet_connection() {
  print_title "Checking internet connection…"
  # if [ ping -q -w1 -c1 1.1.1.1 ] &>/dev/null; then
  if ping -q -w1 -c1 1.1.1.1 &>/dev/null; then
    print_error "Please check your internet connection"
    exit 0
  else
    print_success "Internet connection"
  fi
}

ask_for_sudo() {
  print_title "Caching password…"

  # Ask for the administrator password upfront.

  sudo -v &>/dev/null

  # Update existing `sudo` time stamp
  # until this script has finished.
  #
  # https://gist.github.com/cowboy/3118588

  # Keep-alive: update existing `sudo` time stamp until script has finished
  while true; do
    sudo -n true
    sleep 60
    kill -0 "$$" || exit
  done 2>/dev/null &

  print_success "Password cached"

}

isAdmin() {
  # Check if the current user is in the admin group
  if id -nG | grep -qw admin; then
    return 0 # true
  else
    return 1 # false
  fi
}

# mas account doesn't work anymore
# see https://github.com/mas-cli/mas/issues/417
# mas_setup() {
#   if mas account >/dev/null; then
#     return 0
#   else
#     return 1
#   fi
# }
