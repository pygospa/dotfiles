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
#
# Thanks to Christian Schneider, Michael Prokop, ...
# for sharing their configurations wich has been a great basis to work on my
# own!

if [ -f ~/.zsh/exports.zsh ]; then
	source ~/.zsh/exports.zsh
else
	print "Note: ~/.zsh/exports.zsh is unavailable"
fi


if [ -f ~/.zsh/aliases.zsh ]; then
	source ~/.zsh/aliases.zsh ]
else
	print "Note: ~/.zsh/aliases.zsh is unavailable"
fi

