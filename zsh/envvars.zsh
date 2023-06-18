# Purpose		Environment variables available on any *NIX machine
# 			regardless of the actual OS/distribution.
# Author		Kannan Thambiah <pygospa@gmail.com>
# Latest Version	https://github.com/pygospa/dotfiles


#------------------------------------------------------------------------------
# System Variables
#
export SHELL=`which -p zsh`                      # Shell variable
export NNTPSERVER='nyx.informatik.uni-bremen.de' # Newsserver
export PATH="$HOME/.local/bin:$PATH"             # Add ~/.local/bin to path
export PATH="$HOME/bin:$PATH"                    # Add ~/bin to path
alias sudo="sudo "                        # Expand user aliases when using sudo


#------------------------------------------------------------------------------
# Elixir
#
if [ -d ~/.mix/escripts/ ]; then
    export PATH="$PATH:$HOME/.mix/escripts"
fi


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
# API Keys
#
export ALPHAVANTAGE_API_KEY=V7HRB00Q1011WLGD

## Ruby version manager setup
#if [[ -d "$HOME/.rvm/bin" ]]; then
#	export PATH="$PATH:$HOME/.rvm/bin"
#	[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
#fi

# Python envrionments
if [[ -s "/usr/local/bin/virtualenvwrapper.sh" ]]; then
    export WORKON_HOME=$HOME/.virtualenvs
    export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
    export VIRTUALENVWRAPPER_VIRTUALENV_ARGS=' -p /usr/bin/python3 '
    export PROJECT_HOME=$HOME/files/slab/python
    source /usr/local/bin/virtualenvwrapper.sh
fi
