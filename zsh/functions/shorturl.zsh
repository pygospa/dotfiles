# Create small urls via http://goo.gle using curl().
#
# Copyright (c) 2015, Kannan Thambiah <pygospa@gmail.com>
# Licensed under the MIT license
# Latest version: https://github.com/pygospa/dotfiles
# API reference: https://code.google.com/apis/urlshortener


function shorturl() {
    emulate -L zsh
    setopt extended_glob

    if [[ -z $1 ]]; then
        print "USAGE: shorturl <URL>"
        return 1
    fi

    local PN url prog api json contenttype item
    local -a data
    PN=$0
    url=$1

    # Prepend 'http://' to given URL where necessary for later output.
    if [[ ${url} != http(s|)://* ]]; then
        url='http://'${url}
    fi

    if [[ -x `which curl` ]]; then
        prog=curl
    else
        print "curl is not available, but mandatory for ${PN}. Aborting."
        return 1
    fi
    api='https://www.googleapis.com/urlshortener/v1/url'
    contenttype="Content-Type: application/json"
    json="{\"longUrl\": \"${url}\"}"
    data=(${(f)"$($prog --silent -H ${contenttype} -d ${json} $api)"})
    # Parse the response
    for item in "${data[@]}"; do
        case "$item" in
            ' '#'"id":'*)
                item=${item#*: \"}
                item=${item%\",*}
                printf '%s\n' "$item"
                return 0
                ;;
        esac
    done
    return 1
}





