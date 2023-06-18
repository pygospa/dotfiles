# Purpose		This file contains all color settings for the shell as
#			well as for any shell command that is capable of
#			producing colorful output
#
# Author		Kannan Thambiah <pygospa@gmail.com>
# Latest Version	https://github.com/pygospa/dotfiles


#------------------------------------------------------------------------------
# Do we have a terminal that can handle colors?
#
if [[ "$TERM" != dumb ]]; then

	#----------------------------------------------------------------------
	# Set zsh-wide color variables with colors module, if available
	#
	if autoload -U colors && colors 2>/dev/null ; then

		#--------------------------------------------------------------
		# Using the solarized color settings from Xressources
		#
		YELLOW="%{${fg[yellow]}%}"
		ORANGE="%{${fg_bold[red]}%}"
		RED="%{${fg[red]}%}"
		MAGENTA="%{${fg[magenta]}%}"
		VIOLET="%{${fg_bold[magenta]}%}"
		BLUE="%{${fg[blue]}%}"
		CYAN="%{${fg[cyan]}%}"
		GREEN="%{${fg[green]}%}"
		WHITE="%{${fg[white]}%}"
		BWHITE="%{${fg_bold[white]}%}"
		NC="%{${reset_color}%}"

	#----------------------------------------------------------------------
	# Use ANSI escape codes if we dont have zsh color module
	#
	else
		print 'ZSH module colors not available! Switching to ANSI colors'
		YELLOW=$'%{\e[1;33m%}'
		ORANGE=$'%{\e[0;33m%}'		# brownish color
		RED=$'%{\e[1;31m%}'
		MAGENTA=$'%{\e[1;35m%}'
		VIOLET=$'%{\e[0;35m%}'		# dark magenta
		BLUE=$'%{\e[1;34m%}'
		CYAN=$'%{\e[1;36m%}'
		GREEN=$'%{\e[1;32m%}'
		WHITE=$'%{\e[1;37m%}'
		NC=$'%{\e[0m%}'
	fi

	#----------------------------------------------------------------------
	# Set system variables to show color capabilities
	#
	if [[ `uname -s` == Darwin || `uname -s` == FreeBSD ]]; then
		export CLITERM=1
	else
		export COLORTERM="yes"
	fi

	#----------------------------------------------------------------------
	# Colors for grep
	#
	typeset -ga grep_options
	if grep --help 2> /dev/null | grep -q GNU || [[ `uname -s` == FreeBSD ]]; then
		grep_options=( --color=auto )
	fi

	#----------------------------------------------------------------------
	# Colors for ls
	#
	typeset -ga ls_options
	if ls --help 2> /dev/null | grep -q GNU; then
		# This variable is used in various aliases in ui.zsh
		ls_options=( --color=auto )
	elif [[ `uname -s` == FreeBSD ]]; then
		ls_options=( -G )
	else
		ls_options=()
	fi

	# (dircolors will populate LS_COLORS)
	if [[ -x `which -p dircolors` ]]; then
		eval $(dircolors -b)
	fi


	#----------------------------------------------------------------------
	# Set colors in less
	#
	if [[ -x `which -p less` ]]; then
		export LESS_TERMCAP_mb=$'\E[01;32m' # green	mark blinking
		export LESS_TERMCAP_md=$'\E[01;36m' # cyan	mark bold
		export LESS_TERMCAP_me=$'\E[0m'	    # no color	mark end
		export LESS_TERMCAP_so=$'\E[01;33m' # yellow	start standout
		export LESS_TERMCAP_se=$'\E[0m'	    # no color	stop standout
		export LESS_TERMCAP_us=$'\E[01;35m' # magenta	start underline
		export LESS_TERMCAP_ue=$'\E[0m'	    # no color	end underline
	fi


	#----------------------------------------------------------------------
	# Grep should be colorful
	#
	alias grep='grep '${grep_options:+"${grep_options[*]}"}


	#----------------------------------------------------------------------
	# diff should be colorful
	#
	if [[ `command -v colordiff` ]]; then
		alias diff='colordiff'
	fi

#------------------------------------------------------------------------------
# Dull terminal (i.e. no colors)
#
else
	if [[ `uname -s` == Darwin || `uname -s` == FreeBSD ]]; then
		export CLITERM=0
	else
		export COLORTERM="no"
	fi
fi
