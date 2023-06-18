# If there's an env.sh file in directory, source it when cd'ing into. Ideal if
# you work with different instances of ROCK (http://rock-robotics.org/stable/)
#
# Copyright (c) 2015, Kannan Thambiah <pygospa@gmail.com>
# Licensed under the MIT license
# Latest version: https://github.com/pygospa/dotfiles


function autosource {
	if [[ -s "$PWD/env.sh" ]] && [[ -r "$PWD/env.sh" ]]; then
		source "$PWD/env.sh"
		echo -e "\033[0;31m ! Autosourced $PWD/env.sh ! \033[0m"
	fi
}
chpwd_functions=( "${chpwd_functions[@]}" autosource )
