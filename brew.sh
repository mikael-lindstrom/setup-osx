#!/usr/bin/env bash

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "Installing homebrew..."

# Install homebrew if needed
if test ! $(which brew); then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Add more brew repos
#brew tap homebrew/core
#brew tap homebrew/cask-cask
brew tap homebrew/cask-versions

# Install GNU core utilities
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some nice commandline tools
brew install wget
brew install awscli
brew install tmux
brew install git
brew install zsh
brew install jq
brew install nvm
brew install nmap

# Install Python
brew install python

# Install go
brew install go

# Install more recent versions of some OS X tools.
brew install vim
brew install grep
brew install openssh
brew install screen

# Install some developer tools
brew cask install iterm2
brew cask install gpg-suite
brew cask install viscosity
brew cask install insomnia
brew cask install keybase
brew cask install spectacle
brew cask install authy
brew cask install visual-studio-code
brew cask install docker

# Misc apps
brew cask install dropbox
brew cask install spotify
brew cask install google-chrome
brew cask install google-chrome-canary
brew cask install slack
brew cask install 1password
brew cask install vivaldi
brew cask install transmission

# Cleanup
brew cleanup
