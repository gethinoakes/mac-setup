#####################
# MACOS PREFERENCES #
#####################
echo_warn "Applying macOS preferences"
system_preferences=(
  accessibility
  app-store
  desktop-screensaver
  launchpad # need to come before dock
  mission-control # need to come before dock
  dock
  general
  git
  icloud
  keyboard
  misc
  notifications
  printers-scanners
  security-privacy
  siri
  sound
  spotlight
  time-machine
  trackpad
  users-groups
)

for file in "${system_preferences[@]}"; do
    source "$HOME/mac-setup/macos-prefs/$file.sh"
done
echo_ok "Done applying macOS preferences"