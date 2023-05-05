#!/bin/bash
source "utils.sh"
# ---- Gatekeeper ---- #
print_step "Disabling Gatekeeper"
if spctl --status | grep -q -w enabled; then
  # DISABLE Gatekeeper (Allow apps from "Anywhere")
  sudo spctl --master-disable
  print_success "Gatekeeper disabled"
else
  print_success_muted "Gatekeeper already disabled"
fi
