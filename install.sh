#!/bin/bash
##############################################################################
# Environment Installation
##############################################################################

##############################################################################
# Variables
##############################################################################
dir=~/dotfiles
olddir=~/dotfiles_old
files="bashrc vimrc"  # list of files/folders to symlink in homedir

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

# Elpy Emacs Python Package Configurations
echo "Installing Python packages globally for help with PEP standards"
pip install jedi
pip install flake8
pip install importmagic
pip install autopep8
pip install yapf
