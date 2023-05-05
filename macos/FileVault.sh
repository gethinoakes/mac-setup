#!/bin/bash
source "utils.sh"
# ---- FileVault ---- #
print_step "Enabling FileVault"
if fdesetup status | grep -q "FileVault is On"; then
  print_success_muted "FileVault is already enabled."
else
  sudo fdesetup enable
  print_success "FileVault has been enabled."
fi
