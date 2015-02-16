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

if [ -f ~/dot/zsh/zstyle.zsh ]; then
	source ~/dot/zsh/zstyle.zsh
else
	printf "Note: ~/.zsh/zstyle.zsh is unavailable"
fi


#if [ -f ~/dot/zsh/options.zsh ]; then
#	source ~/dot/zsh/options.zsh
#else
#	print "Note: ~/.zsh/options.zsh is unavailable"
#fi

if [ -f ~/dot/zsh/prompt.zsh ]; then
	source ~/dot/zsh/prompt.zsh 
else
	print "Note: ~/.zsh/prompt.zsh is unavailable"
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

if [ -f ~/dot/zsh-vcs-prompt/zshrc.sh ]; then
	source ~/dot/zsh-vcs-prompt/zshrc.sh
	ZSH_VCS_PROMPT_ENABLE_CACHING='true'
else
	printf "Note: ~/.zsh-vc-prompt/zshrc.sh is unavailable"
fi

