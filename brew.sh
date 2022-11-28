#!/usr/bin/env bash

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "Installing homebrew..."

# Install homebrew if needed
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

eval "$(/opt/homebrew/bin/brew shellenv)"

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities
brew install coreutils
brew install grep

# Install some nice commandline tools
brew install wget
brew install awscli
brew install tmux
brew install git
brew install zsh
brew install jq
brew install nmap
brew install direnv
brew install aws-vault
brew install ykman
brew install fzf
brew install zoxide
brew install gh
brew install ripgrep
brew install bat

# Install go
brew install go

# Install rustup
brew install rustup-init

# Install more recent versions of some OS X tools.
brew install neovim
brew install openssh
brew install screen

# Language servers
brew install lua-language-server

# Install some developer tools
brew install --cask iterm2
brew install --cask keybase
brew install --cask rectangle
brew install --cask authy
brew install --cask visual-studio-code
brew install --cask docker
brew install --cask goland
brew install --cask session-manager-plugin

# Kubernetes tools
brew install derailed/popeye/popeye

# Misc apps
brew install --cask dropbox
brew install --cask spotify
brew install --cask google-chrome
brew install --cask slack
brew install --cask 1password
brew install --cask vivaldi
brew install --cask transmission
brew install --cask zoom
brew install --cask homebrew/cask-drivers/elgato-control-center
brew install --cask discord

# Cleanup
brew cleanup
