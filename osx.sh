#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `osxprep.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "Updating OSX.  If this requires a restart, run the script again."
sudo softwareupdate -i -a

echo "Installing Xcode Command Line Tools."
xcode-select --install

# Enable the automatic update check
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

# Check for software updates daily, not just once per week
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate ScheduleFrequency -int 1

# Download newly available updates in background
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticDownload -int 1

# Install System data files & security updates
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate CriticalUpdateInstall -int 1

# Disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable smart dashes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Show hidden files by default in finder
#defaults write com.apple.finder AppleShowAllFiles -bool true

# Show all filename extensions in finder
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Show status bad in finder
defaults write com.apple.finder ShowStatusBar -bool true

# Show path bar in finder
defaults write com.apple.finder ShowPathbar -bool true

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Use list view in all Finder windows by default
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Remove the auto-hiding Dock delay
defaults write com.apple.dock autohide-delay -float 0

# Remove the animation when hiding/showing the Dock
defaults write com.apple.dock autohide-time-modifier -float 0.5

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Menu bar: show battery percentage
defaults -currentHost write com.apple.controlcenter BatteryShowPercentage -bool true

# Setup firewall
sudo defaults write /Library/Preferences/com.apple.alf globalstate -int 1

# Fix Fn keys to work properly
defaults write NSGlobalDomain com.apple.keyboard.fnState -boolean true

# Set trackpad behaviour to tap-click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Enable sound feedback on volume change
defaults write NSGlobalDomain com.apple.sound.beep.feedback -int 1

# Always show bluetooth in menu bar
defaults -currentHost write com.apple.controlcenter Bluetooth -int 18

# Always show sound in menu bar
defaults -currentHost write com.apple.controlcenter Sound -int 16

# Disable natural scroll
defaults write -g com.apple.swipescrolldirection -int 0

# Visualize CPU usage in the Activity Monitor Dock icon
defaults write com.apple.ActivityMonitor IconType -int 5

# Show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 100

