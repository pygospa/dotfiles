#!/bin/sh
#
# Creates a backup of existing dotfiles and symlinks these dotfiles to home
# Copyright (c) 2017, Kannan Thambiah <pygospa@gmail.com>
# Licensed under the MIT license
# Latest version: https://github.com/pygospa/dotfiles


#------------------------------------------------------------------------------
# Variable setup
#

# Dotfilepath and files to exclude
DFP=$( (cd -P $(dirname $0) && pwd) )

# If we are on a macOS powered machine, exclude typical Linux only software
if [[ `uname -s` == Darwin ]]; then
  EXCL=( asound backup config/user-dirs.dirs i3 install.sh LICENSE mutt muttrc\
	  ousted README.md uninstall.sh xinitrc Xresources )
# If we are on a non macOS powered Unix machine, exclude only the repository stuff
else
  EXCL=( backup install.sh LICENSE ousted README.md uninstall.sh )
fi


#------------------------------------------------------------------------------
# Directory creation
#

# Create a backup directory inside the dotfile path
mkdir -p $DFP/backup

# Do we need directories for the Z-Shell?
if ! [[ ${EXCL[*]} =~ "zsh" ]]; then
	mkdir -p $DFP/zsh/zkbd
fi

# Do we need directories for vim?
if ! [[ ${EXCL[*]} =~ "vim" ]]; then
	mkdir -p $HOME/tmp/vim/swaps
	mkdir -p $HOME/tmp/vim/backups
	mkdir -p $HOME/tmp/vim/undos
fi

# Do we need directories for i3?
if ! [[ ${EXCL[*]} =~ "vim" ]]; then
	mkdir -p $HOME/tmp/shots
fi


#------------------------------------------------------------------------------
# Install actual config files
#

for file in *; do
  # File is not excluded
  if ! [[ ${EXCL[*]} =~ "$file" ]]; then
    # config already exist? Move it to $DFP/backup and be verbose about it
    if [[ -f ~/.$file || -d ~/.$file ]]; then
      echo ""
      echo "mv ~/.$file $DFP/backup/$file"
      mv ~/.$file $DFP/backup/$file
    fi
    # link the config file from $DSP to $HOME as expected by application
    echo "ln -sf $DFP/$file ~/.$file"
    ln -sf $DFP/$file ~/.$file
  fi
done
