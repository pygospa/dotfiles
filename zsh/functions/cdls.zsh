# cd into directory and list its files
#
# Copyright (c) 2015, Kannan Thambiah <pygospa@gmail.com>
# Licensed under the MIT license
# Latest version: https://github.com/pygospa/dotfiles


cdls() {
    emulate -L zsh
    cd $1 && ls -a
}
