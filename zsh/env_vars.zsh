# File			~/.zsh/env_vars.zsh
#
# Purpose		There are certain environment variables that are
#			available on any *NIX machine and that I like to set
#			accordingly, regardless of the actual OS or machine I
#			am working on. These are collected here (specific
#			settings are found in the other files accordingly)
#
# Author		Kannan Thambiah <pygospa@gmail.com>
# Lates Version		github.com/pygospa/dotfiles



# Set the shell variable
export SHELL='/bin/zsh'

# PATH 
# ~/bin -> /usr/local/bin -> /usr/bin -> /bin -> /usr/sbin -> /sbin -> /opt/bin -> /usr/games/bin
export PATH="$HOME/bin:/usr/local/bin:/usr/local/rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/bin:/usr/games/bin"

# Set the Editor
if [[ -x `which vim` ]]; then
	export EDITOR=${EDITOR:-vim}
else
	export EDITOR=${EDITOR:-vi}
fi

# vi should point to vim
if [[ -x `which vim` ]]; then
	alias vi=`which vim`
fi

# Set less and zless to point to vimpager, if vimpager is installed
if [[ -x `which vimpager` ]]; then
	alias less=$PAGER
	alias zless=$PAGER
fi

# Set the Pager variable
#if [[ -x `which vimpager` ]]; then
#	export PAGER=${PAGER:-vimpager}
#elif [[ -x `which less` ]]; then
#	export PAGER=${PAGER:-less}
#	# Use colors in less
#else
#	export PAGER=${PAGER:-more}
#fi

