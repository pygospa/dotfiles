#!/bin/sh

# Dotfilepath and files to exclude
DFP=$( (cd -P $(dirname $0) && pwd) )
EXCL=(install.sh ousted readme.md)

for F in *; do 
  if ! [[ ${EXCL[*]} =~ "$F" ]]; then
    ln -sf $DFP/$F ~/.$F
  fi
done

