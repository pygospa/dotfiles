# File			~/.zsh/sysvars.zsh
#
# Purpose		File containing system variable exports
#
# Author		Kannan Thambiah <pygospa@gmail.com>
# Latest Version	https://github.com/pygospa/dotfiles
# License		CC BY-SA 4.0, if applicable and compatible to software
#			license


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
else
	export PAGER=${PAGER:-more}
fi

# However, we don't want Git to use the standard pager (this will open a new
# vim instance on easy tasks that I want to run on less, such as display git
# diff)
if [[ -x `which git` ]]; then 
	export GIT_PAGER=`which less`
fi

# PATH 
# ~/bin -> /usr/local/bin -> /usr/bin -> /bin -> /usr/sbin -> /sbin -> /
export PATH="$HOME/bin:/usr/local/bin:/usr/local/rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin"

