# File			~/.zshrc 
#
# Purpose		main configuration file for the Z-Shell
#			This file tests and sources sub-config files, if
#			available and notifies user, if not available.
#			"Explicite is better than implicite" - so everything is
#			configured explicitly (e.g. building the Path, etc.).
#			Keep that in mind!
#
# Author		Kannan Thambiah <pygospa@gmail.com>
# Lates Version		github.com/pygospa/dotfiles

# Keyboard settings, so that function keys work independantly from the term
# (needed as zsh does not use /etc/inputrc)
if [ -f ~/dot/zsh/keys.zsh ]; then
	source ~/dot/zsh/keys.zsh
else
	printf "Note ~/.zsh/keys.zsh is unavailable\n"
fi

# Environment variables, such as $PATH, $EDITOR, $PAGER, etc.
if [ -f ~/dot/zsh/envvars.zsh ]; then
	source ~/dot/zsh/envvars.zsh
else
	printf "Note ~/.zsh/envvars.zsh\n"
fi

# Color settings
if [ -f ~/dot/zsh/colors.zsh ]; then
	source ~/dot/zsh/colors.zsh
else
	printf "Note ~/.zsh/colors.zsh is unavailable\n"
fi

# File system navigation tool settings and aliases for easier navigation and
# getting directory information 
if [ -f ~/dot/zsh/userinterface.zsh ]; then
	source ~/dot/zsh/userinterface.zsh
else
	printf "Note ~/.zsh/userinterface.zsh\n"
fi

# Completion settings
if [ -f ~/dot/zsh/completion.zsh ]; then
	source ~/dot/zsh/completion.zsh
else
	printf "Note ~/.zsh/completion.zsh is unavailable\n"
fi

# History settings
if [ -f ~/dot/zsh/history.zsh ]; then
	source ~/dot/zsh/history.zsh
else
	printf "Note ~/.zsh/history.zsh is unavailable\n"
fi

# System Prompt Settings
if [ -f ~/dot/zsh/prompt.zsh ]; then
	source ~/dot/zsh/prompt.zsh 
else
	print "Note: ~/.zsh/prompt.zsh is unavailable\n"
fi

# GIT/Mercurial settings
if [ -f ~/dot/zsh/dvcs.zsh ]; then
	source ~/dot/zsh/dvcs.zsh
else
	print "Note: ~/.zsh/dvcs.zsh is unavailable\n"
fi

# Files to source, if it's a Mac OS X
if [[ `uname -s` == Darwin ]]; then
	if [ -f ~/dot/zsh/darwin.zsh ]; then
		source ~/dot/zsh/darwin.zsh
	else
		printf "Note: Running on OS X, but ~/.zsh/darwin.zsh is unavailable\n"
	fi
fi

# Files to source if it's my old home PC 'eisdrache'
if [[ `uname -n` == eisdrache ]]; then
	if [ -f ~/dot/zsh/eisdrache.zsh ]; then
		source ~/dot/zsh/eisdrache.zsh
	else
		printf "Note: Running on eisdrache, but ~/.zsh/eisdrache.zsh is unavailable\n"
	fi
fi

# File to source if it's my new home PC 'ancalagon'
if [[ `uname -n` == ancalagon ]]; then
	if [ -f ~/dot/zsh/ancalagon.zsh ]; then
		source ~/dot/zsh/ancalagon.zsh
	else
		printf "Note: Running on ancalagon, but ~/.zsh/ancalagon.zsh is unavailable\n"
	fi
fi






if [[ -f ~/dot/zsh/autoload.zsh ]]; then 
	source ~/dot/zsh/autoload.zsh
else
	printf "Note ~/.zsh/autoload.zsh is unavailable\n"
fi

if [ -f ~/dot/zsh/functions.zsh ]; then
	source ~/dot/zsh/functions.zsh
else
	printf "Note: ~/.zsh/functions.zsh is unavailable\n"
fi

if [ -f ~/dot/zsh/options.zsh ]; then
	source ~/dot/zsh/options.zsh
else
	print "Note: ~/.zsh/options.zsh is unavailable\n"
fi

