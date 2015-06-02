# File			~/.zsh/versioncontrol.zsh
#
# Purpose		I consider version control system to be one of the most
#			important tool invented - especially for computer
#			scientists and developers - and I use them every day,
#			so I am pretty particular about how they should work
# 
# Author		Kannan Thambiah <pygospa@gmail.com>
# Lates Version		github.com/pygospa/dotfiles


# Git pager
if [[ -x `which git` ]]; then 
	export GIT_PAGER=`which less`
fi

# I am a lazy bum
if [[ -x `which git` ]]; then
	alias g='git'
fi
