# File			~/.zsh/exports.zsh
#
# Purpose		Subdirectory file containing system variable exports
#
# Author		Kannan Thambiah <pygospa@gmail.com>
# Latest Version	github.com/pygospa/dotfiles

# Some settings that are controlled via variables:
# History
HISTFILE=${HOME}/.zsh_history
# Number of lines to keep in history of the active session
HISTSIZE=10000
# Number of lines to persistantly save to histfile
SAVEHIST=10000

# set the terminal property
export COLORTERM="yes"

# Set the shell variable
export SHELL='/bin/zsh'

# Set the Editor
if [[ -x `which vim` ]]; then
	export EDITOR=${EDITOR:-vim}
else
	export EDITOR=${EDITOR:-vi}
fi

# Set the Pager variable
if [[ -x `which vimpager` ]]; then
	export PAGER=${PAGER:-vimpager}
elif [[ -x `which less` ]]; then
	export PAGER=${PAGER:-less}
	# Use colors in less
	export LESS_TERMCAP_mb=$'\E[01;31m'
	export LESS_TERMCAP_md=$'\E[01;31m'
	export LESS_TERMCAP_me=$'\E[0m'
	export LESS_TERMCAP_se=$'\E[0m'
	export LESS_TERMCAP_so=$'\E[01;44;33m'
	export LESS_TERMCAP_ue=$'\E[0m'
	export LESS_TERMCAP_us=$'\E[01;32m'
else
	export PAGER=${PAGER:-more}
fi

# However, we don't want Git to use the standard pager (this will open a new
# vim instance on easy tasks that I want to run on less, such as display git
# diff)
if [[ -x `which git` ]]; then 
	export GIT_PAGER=`which less`
fi

# ls colors
# (dircolors will populate LS_COLORS)
if [[ -x `which dircolors` ]]; then
        eval $(dircolors -b)
fi

if [[ `uname -s` == Darwin || `uname -s` == FreeBSD ]]; then
	export CLICOLOR=1;
fi
 
typeset -ga ls_options

if ls --help 2> /dev/null | grep -q GNU; then
        ls_options=( --color=auto )
elif [[ `uname -s` == FreeBSD ]]; then
        ls_options=( -G )
fi

# grep colors
typeset -ga grep_options

if grep --help 2> /dev/null | grep -q GNU || [[ `uname -s` == FreeBSD ]]; then
	grep_options=( --color=auto )
fi


# PATH 
# ~/bin -> /usr/local/bin -> /usr/bin -> /bin -> /usr/sbin -> /sbin -> /
export PATH="$HOME/bin:/usr/local/bin:/usr/local/rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# Are we running OS X?
if [[ `uname -s` == Darwin ]]; then 
	# Mac keeps path information in /etc/paths.d to automatically create path
	# entries for new installed software. As we rewrite the path, we add them
	# manually
	for file in /etc/paths.d/*; do
		new="$(<$file)"
		export PATH="$PATH:$new"
	done

	# Use Firefox as default browser on OS X, if available
	if [[ -x /Applications/Firefox.app/Contents/MacOS/firefox ]]; then
		export BROWSER="/Applications/Firefox.app/Contents/MacOS/firefox"
	fi
fi
