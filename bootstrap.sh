#!/usr/bin/env bash

echo ""
echo "--------------------------------------------------"
echo "Updating OSX and installing command line tools"
echo "--------------------------------------------------"
echo ""
./osx.sh

echo ""
echo "--------------------------------------------------"
echo "Installing homebrew with some packages"
echo "--------------------------------------------------"
echo ""
./brew.sh

echo ""
echo "--------------------------------------------------"
echo "Installing oh-my-zsh"
echo "--------------------------------------------------"
echo ""
./zsh.sh

# echo ""
# echo "--------------------------------------------------"
# echo "Installing node/some npm packages"
# echo "--------------------------------------------------"
# echo ""
# ./npm.sh

echo ""
echo "--------------------------------------------------"
echo "Installing iterm themes"
echo "--------------------------------------------------"
echo ""
./iterm.sh

echo ""
echo "--------------------------------------------------"
echo "Copying dotfiles"
echo "--------------------------------------------------"
echo ""
cp -rf dot-files/ ~/

echo ""
echo "Done, make sure to apply the colors/fonts in iterm"
