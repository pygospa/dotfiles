# List files wich have been modified within the last n days. n defaults to 1
#
# Copyright (c) 2015, Kannan Thambiah <pygospa@gmail.com>
# Licensed under the MIT license
# Latest version: https://github.com/pygospa/dotfiles


modified() {
    emulate -L zsh
    print -l -- *(m-${1:-1})
}
