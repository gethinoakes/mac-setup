echo_warn "Applying app preferences"
app_preferences=(
  activity-monitor
  contacts
  finder
  photos
  safari
  terminal
)

for file in "${app_preferences[@]}"; do
  source "$HOME/mac-setup/app-prefs/$file.sh"
done
echo_ok "Done applying app preferences"