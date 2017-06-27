#!/usr/bin/env bash

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

export NVM_DIR=~/.nvm
. $(brew --prefix nvm)/nvm.sh

nvm install stable

npm install -g bower
npm install -g grunt
npm install -g jshint
npm install -g jsonlint
