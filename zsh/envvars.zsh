# Purpose		Environment variables available on any *NIX machine
# 			regardless of the actual OS/distribution.
# Author		Kannan Thambiah <pygospa@gmail.com>
# Latest Version	https://github.com/pygospa/dotfiles


#------------------------------------------------------------------------------
# System Variables
#
export SHELL=`which -p zsh`				# Shell variable
export NNTPSERVER='nyx.informatik.uni-bremen.de'	# Newsserver
# Preceed path with ~/bin - a folder I always create and whre I keep software
# and scripts that I developed myself and that should be in path
export PATH="$HOME/bin:$PATH"


#------------------------------------------------------------------------------
# Editor
#
if [[ -x `which -p vim` ]]; then
	export EDITOR=`which -p vim`
	alias vi=`which -p vim`
else
	export EDITOR=`which -p vi`
fi


#------------------------------------------------------------------------------
# Pager
#
if [[ -x `which -p vimpager` ]]; then
	export PAGER=`which -p vimpager`
elif [[ -x `which -p less` ]]; then
	export PAGER=`which -p less`
else
	export PAGER=`which -p more`
fi

#------------------------------------------------------------------------------
# Programming
#

# Go workspace setup
if [[ -x `which -p go` ]]; then
	export GOPATH="$HOME/slab/ws/go"
	export GOBIN="$HOME/slab/ws/go/bin"
	export GOROOT="/usr/local/opt/go/libexec"
	export PATH="$PATH:$GOPATH/bin"
	export PATH="$PATH:$GOPATH/bin"
fi

# Ruby version manager setup
if [[ -d "$HOME/.rvm/bin" ]]; then
	export PATH="$PATH:$HOME/.rvm/bin"
	[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
fi

# Python envrionments
if [[ -s "/usr/local/bin/virtualenvwrapper.sh" ]]; then
    export WORKON_HOME=$HOME/.virtualenvs
    export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
    export VIRTUALENVWRAPPER_VIRTUALENV_ARGS=' -p /usr/bin/python3 '
    export PROJECT_HOME=$HOME/files/slab/python
    source /usr/local/bin/virtualenvwrapper.sh
fi
