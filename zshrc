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


# File containing color settings
if [ -f ~/dot/zsh/colors.zsh ]; then
	source ~/dot/zsh/colors.zsh
else
	printf "Note ~/.zsh/colors.zsh is unavailable"
fi

# File containing completion settings
if [ -f ~/dot/zsh/completion.zsh ]; then
	source ~/dot/zsh/completion.zsh
else
	printf "Note ~/.zsh/completion.zsh is unavailable"
fi

# File containing history settings
if [ -f ~/dot/zsh/history.zsh ]; then
	source ~/dot/zsh/history.zsh
else
	printf "Note ~/.zsh/history.zsh is unavailable"
fi

# File containing the prompt settings
if [ -f ~/dot/zsh/prompt.zsh ]; then
	source ~/dot/zsh/prompt.zsh 
else
	print "Note: ~/.zsh/prompt.zsh is unavailable"
fi

# Files to source, if it's a Mac OS X
if [[ `uname -s` == Darwin ]]; then
	if [ -f ~/dot/zsh/darwin.zsh ]; then
		source ~/dot/zsh/darwin.zsh
	else
		printf "Note: Running on OS X, but ~/.zsh/darwin.zsh is unavailable"
	fi
fi

# Files to source if it's my home PC 'eisdrache'
if [[ `uname -n` == eisdrache ]]; then
	if [ -f ~/dot/zsh/eisdrache.zsh ]; then
		source ~/dot/zsh/eisdrache.zsh
	else
		printf "Note: Running on eisdrache, but ~/.zsh/eisdrache.zsh is unavailable"
	fi
fi







if [[ -f ~/dot/zsh/autoload.zsh ]]; then 
	source ~/dot/zsh/autoload.zsh
else
	printf "Note ~/.zsh/autoload.zsh is unavailable"
fi

if [ -f ~/dot/zsh/functions.zsh ]; then
	source ~/dot/zsh/functions.zsh
else
	printf "Note: ~/.zsh/functions.zsh is unavailable"
fi

if [ -f ~/dot/zsh/options.zsh ]; then
	source ~/dot/zsh/options.zsh
else
	print "Note: ~/.zsh/options.zsh is unavailable"
fi

if [ -f ~/dot/zsh/zstyle.zsh ]; then
	source ~/dot/zsh/zstyle.zsh
else
	printf "Note: ~/.zsh/zstyle.zsh is unavailable"
fi

if [ -f ~/dot/zsh/exports.zsh ]; then
	source ~/dot/zsh/exports.zsh
else
	print "Note: ~/.zsh/exports.zsh is unavailable"
fi

if [ -f ~/dot/zsh/aliases.zsh ]; then
	source ~/dot/zsh/aliases.zsh ]
else
	print "Note: ~/.zsh/aliases.zsh is unavailable"
fi


