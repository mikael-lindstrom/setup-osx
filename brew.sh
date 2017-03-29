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
brew upgrade --all

# Install GNU core utilities
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some nice commandline tools
brew install wget --with-iri
brew install tmux
brew install git
brew install zsh
brew install autossh
brew install jq
brew install pwgen
brew install packer
brew install ansible
brew install nvm
brew install openconnect
brew install macpass
brew install jid
brew cask install transmission

# Install Python
brew install python
brew install python3

# Install go
brew install go

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen

# Keybase
brew install keybase

# Install Cask
brew install caskroom/cask/brew-cask

# Install some developer tools
brew cask install --appdir="~/Applications" iterm2
brew cask install --appdir="~/Applications" java
brew cask install --appdir="/Applications" atom
brew cask install --appdir="/Applications" vmware-fusion
brew cask install --appdir="/Applications" vagrant
brew cask install --appdir="/Applications" virtualbox
brew cask install --appdir="/Applications" gpgtools
brew cask install --appdir="/Applications" intellij-idea
brew cask install --appdir="/Applications" viscosity
brew cask install --appdir="/Applications" insomnia

# Misc apps
brew cask install --appdir="/Applications" dropbox
brew cask install --appdir="/Applications" spotify
brew cask install --appdir="/Applications" google-chrome
brew cask install --appdir="/Applications" slack
brew cask install --appdir="/Applications" slack-beta
brew cask install --appdir="/Applications" dropbox
brew cask install --appdir="/Applications" evernote
brew cask install --appdir="/Applications" 1password

brew cask install moeditor
brew cask install google-cloud-sdk

# Install Docker
brew install docker
brew install docker-machine
brew install docker-compose

brew install Caskroom/cask/puppet
brew install Caskroom/cask/caffeine

# Cleanup
brew cleanup
