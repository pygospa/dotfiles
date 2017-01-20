# Makde directory and change into it
#
# Copyright (c) 2015, Kannan Thambiah <pygospa@gmail.com>
# Licensed under the MIT license
# Latest version: https://github.com/pygospa/dotfiles


function mcd() {
  mkdir -p "$1" && cd "$1";
}

