#!/bin/bash
##############################################################################
# Environment Installation
##############################################################################

##############################################################################
# Variables
##############################################################################
dir=~/dotfiles
olddir=~/dotfiles_old
files="bashrc screenrc vimrc conkerorrc"  # list of files/folders to symlink in homedir
emacs_files="init.el" # future list of files/folder to symlink in emacs.d

##############################################################################
# Functions
##############################################################################


##############################################################################
# Main Runner
##############################################################################
# Create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles"
mkdir -p $olddir
echo "...done"

# Change to the dotfile directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# Move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
    echo "Moving any existing dotfiles from - to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

# Move any existing emacs dotfiles to .emacs.d
for file in $emacs_files; do
    echo "Moving any existing emacs dotfiles from - to $olddir"
    mv ~/.emacs.d/$file ~/dotfiles_old/
    echo "Creating symlink to $file in .emacs.d"
    ln -s $dir/$file ~/.emacs.d/$file
done

# Elpy Emacs Python Package Configurations
echo "Installing Python packages globally for help with PEP standards"
sudo apt-get install python-pip
sudo pip install jedi
sudo pip install flake8
sudo pip install importmagic
sudo pip install autopep8
sudo pip install yapf
sudo pip install jsbeautifier

# Install Racket
sudo apt-get install racket

# JavaScript Helpers
sudo apt-get install npm
sudo npm install -g jshint
sudo npm install -g js-beautify
sudo npm install -g csslint

# Install surfraw for broswer interaction via Emacs Helm mode
echo "Installing surfraw for internet surfing via Emacs and Terminal"
sudo apt-get install surfraw

# Install Tidy
echo "Installing tidy for use with web-mode"
sudo apt-get install tidy

# Install ImageMagick
echo "Installing ImageMagick for use with org-mode"
sudo aptitude install imagemagick

# Utilities
sudo apt-get install zip unzip build-essential curl
