#!/bin/sh
# Author:	Kannan Thambiah <pygospa@gmail.com>
# Copyright:	CC BY-SA 4.0 <http://creativecommons.org/licenses/by-sa/4.0>

# Dotfilepath and files to exclude
DFP=$( (cd -P $(dirname $0) && pwd) )

if [[ `uname -s` == Darwin ]]; then
  EXCL=(asoundrc fvwm install.sh ousted README.md xinitrc Xresources)
else 
  EXCL=(install.sh ousted README.md)
fi

for F in *; do 
  if ! [[ ${EXCL[*]} =~ "$F" ]]; then
    ln -sf $DFP/$F ~/.$F
  fi
done

