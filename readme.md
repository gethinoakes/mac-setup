# Personalized macOS Setup

Various scripts, personalised to me, that I run when setting up a new mac to install apps & apply preferences etc. Feel free to take a look and use any of the code for your own setup scripts.

It is to be first ran on the main user account, during which it will install homebrew, apps, node and global npm packages. If/When setting up on a secondary account, these are not run to avoid any issues and only the app & macOS preferences are applied.

## Order of setup

### Only if first setup

- Install Xcode Command Line Developer Tools & agree to license
- Install Homebrew:
  - homebrew packages & mackup config
  - quick look plugins & fonts
  - mac apps
  - MAS apps
- Install node via NVM and global NPM packages for development

### Always

- App preferences
- macOS preferences
