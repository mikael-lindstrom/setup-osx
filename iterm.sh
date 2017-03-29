#!/usr/bin/env bash

echo "Install iterm themes"

open iterm/Solarized\ Dark.itermcolors
open iterm/Solarized\ Light.itermcolors

echo "Installing powerline fonts..."
cd fonts
./install.sh Meslo

echo "Set font in iterm to '11pt Meslo LG M DZ Regular for Powerline' manually"
