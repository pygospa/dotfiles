# List files which have been accessed within the last n days. n defaults to 1
#
# Copyright (c) 2015, Kannan Thambiah <pygospa@gmail.com>
# Licensed under the MIT license
# Latest version: https://github.com/pygospa/dotfiles


accessed() {
    emulate -L zsh
    print -l -- *(a-${1:-1})
}
