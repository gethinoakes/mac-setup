#!/usr/bin/env bash

###############################################################################
# Messages
###############################################################################

# Save history when conversations are closed
defaults write com.apple.iChat SaveConversationsOnClose -bool true

# Notify me when my name is mentioned
defaults write com.apple.messageshelper.AlertsController SOAlertsAddressMeKey -bool true