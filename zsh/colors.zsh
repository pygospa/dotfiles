# File			~/.zsh/colors.zsh
#
# Purpose		This file contains all color settings
#
# Author		Kannan Thambiah <pygospa@gmail.com>
# Latest Version	https://github.com/pygospa/dotfiles
# License		CC BY-SA 4.0, if applicable and compatible to software
#			license

# We have a terminal that can handle colors
if [[ "$TERM" != dumb ]]; then

	# We've got zsh color module?
	if autoload -U colors && colors 2>/dev/null ; then
		# Using the solarized color settings in Xressources
		YELLOW="%{${fg[yellow]}%}"
		ORANGE="%{${fg_bold[red]}%}"
		RED="%{${fg[red]}%}"
		MAGENTA="%{${fg[magenta]}%}"
		VIOLET="%{${fg_bold[magenta]}%}"
		BLUE="%{${fg[blue]}%}"
		CYAN="%{${fg[cyan]}%}"
		GREEN="%{${fg[green]}%}"
		WHITE="%{${fg[white]}%}"
		NC="%{${reset_color}%}"

		# Use ANSI escape codes
	elif [[ "$TERM" != dumb ]]; then
		print 'colors not available!'
		BLUE=$'%{\e[1;34m%}'
		RED=$'%{\e[1;31m%}'
		GREEN=$'%{\e[1;32m%}'
		CYAN=$'%{\e[1;36m%}'
		WHITE=$'%{\e[1;37m%}'
		MAGENTA=$'%{\e[1;35m%}'
		YELLOW=$'%{\e[1;33m%}'
		NO_COLOR=$'%{\e[0m%}'
	fi

	# Set system variables to show color capabilities
	if [[ `uname -s` == Darwin || `uname -s` == FreeBSD ]]; then
		export CLITERM=1
	else
		export COLORTERM="yes"
	fi

	# Colors for vi
	typeset -ga ls_options
	if ls --help 2> /dev/null | grep -q GNU; then
		ls_options=( --color=auto )
	elif [[ `uname -s` == FreeBSD ]]; then
		ls_options=( -G )
	fi

	# Colors for grep
	typeset -ga grep_options
	if grep --help 2> /dev/null | grep -q GNU || [[ `uname -s` == FreeBSD ]]; then
		grep_options=( --color=auto )
	fi

	# Colors for ls
	# (dircolors will populate LS_COLORS)
	if [[ -x `which dircolors` ]]; then
		eval $(dircolors -b)
	fi

	# Set colors in less
	if [[ -x `which less` ]]; then
		export LESS_TERMCAP_mb=$'\E[01;32m'
		export LESS_TERMCAP_md=$'\E[01;36m'
		export LESS_TERMCAP_me=$'\E[0m'
		export LESS_TERMCAP_se=$'\E[0m'
		export LESS_TERMCAP_so=$'\E[01;33m'
		export LESS_TERMCAP_ue=$'\E[0m'
		export LESS_TERMCAP_us=$'\E[01;35m'
	fi
# No color terminal
else
	if [[ `uname -s` == Darwin || `uname -s` == FreeBSD ]]; then
		export CLITERM=0
	else
		export COLORTERM="no"
	fi
fi
