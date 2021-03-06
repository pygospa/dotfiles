#!/bin/sh
#
# Remove created symlinks to these dotfiles and copy back originals from backup
# Copyright (c) 2017, Kannan Thambiah <pygospa@gmail.com>
# Licensed under the MIT license
# Latest version: https://github.com/pygospa/dotfiles


# Dotfilepath and files to exclude
DFP=$( (cd -P $(dirname $0) && pwd) )
EXCL=(backup install.sh ousted README.md)

# Remove all created symbolic links 
for F in *; do 
  if ! [[ ${EXCL[*]} =~ "$F" ]]; then
    if [[ -L ~/.$F && "$(readlink ~/.$F)" =~ "$DPF" ]]; then
      rm -rf ~/.$F
    fi
  fi
done

# Restore backed up configs
# Trick, cause . and .. are also tried to be moved, if just using .*
for F in $DFP/backup/.??*; do
    mv "$F" ~/
done

# Remove the file (for later reinstall)
rmdir $DFP/backup

