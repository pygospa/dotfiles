#!/bin/sh
# Author:	Kannan Thambiah <pygospa@gmail.com>
# Copyright:	CC BY-SA 4.0 <http://creativecommons.org/licenses/by-sa/4.0>

# Dotfilepath and files to exclude
DFP=$( (cd -P $(dirname $0) && pwd) )
EXCL=(install.sh ousted README.md)

for F in *; do 
  if ! [[ ${EXCL[*]} =~ "$F" ]]; then
    ln -sf $DFP/$F ~/.$F
  fi
done

