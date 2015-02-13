# File			~/.zsh/autoload.zsh
#
# Purpose		autoload zsh 
#			Here all subsystems of ZSH are loaded and initialized
#
# Author		Kannan Thambiah <pygospa@gmail.com>
# Lates Version		github.com/pygospa/dotfiles
#
# Thanks to Christian Schneider, Michael Prokop, and the Grml Developers
# for sharing their configurations wich has been a great basis to work on my
# own!

autoload -U compinit && compinit -u || print 'compinit not available!'

# Load colors package and set colors (according to if it is usable or not
if autoload -U colors && colors 2>/dev/null ; then
	BLUE="%{${fg[blue]}%}"
	RED="%{${fg_bold[red]}%}"
	GREEN="%{${fg[green]}%}"
	CYAN="%{${fg[cyan]}%}"
	MAGENTA="%{${fg[magenta]}%}"
	YELLOW="%{${fg[yellow]}%}"
	WHITE="%{${fg[white]}%}"
	NO_COLOR="%{${reset_color}%}"
else
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

