#!/bin/sh
# Author:	Kannan Thambiah <pygospa@gmail.com>
# Copyright:	CC BY-SA 4.0 <http://creativecommons.org/licenses/by-sa/4.0>

# Dotfilepath and files to exclude
DFP=$( (cd -P $(dirname $0) && pwd) )
EXCL=(backup install.sh ousted README.md)

# Create backup directory inside dotfilepath
mkdir $DFP/backup

# Create symbolic link to configs and save pre-existing dotfiles into DFP/backup
for F in *; do 
  if ! [[ ${EXCL[*]} =~ "$F" ]]; then
    if [[ -f ~/.$F ]]; then
      mv ~/.$F $DFP/backup/.$F
    fi
    ln -sf $DFP/$F ~/.$F
  fi
done

