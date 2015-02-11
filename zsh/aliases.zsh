# File			~/.zsh/aliases.zsh
#
# Purpose		Aliases I like to use
#			This file tests for certain executables, and if it
#			finds them, aliases I like to use for these tools are
#			created.
#
# Author		Kannan Thambiah <pygospa@gmail.com>
# Lates Version		github.com/pygospa/dotfiles



# --------------------------------------------------------------------------- #
#			System						      #
# --------------------------------------------------------------------------- #

# Check for color term
if [[ "$TERM" != dumb ]]; then
	# -b = C-Style escapes
	# -C = Columns
	# -F = Append indicator (one of * / = > @ |)
	# -a = All files (including . )
	# -A = Almost all (ignoring . and .. )
	# -l = Long format
	# -h = human readable size
	alias l='ls -lF '${ls_options:+"${ls_options[*]}"}	
	alias la='ls -la '${ls_options:+"${ls_options[*]}"}
	alias lh='ls -hAl '${ls_options:+"${ls_options[*]}"}
	alias ll='ls -l '${ls_options:+"${ls_options[*]}"}
	alias ls='ls -b -CF '${ls_options:+"${ls_options[*]}"}
else
	alias l='ls -lF'
	alias la='ls -la'
	alias lh='ls -hAl'
	alias ll='ls -l'
	alias ls='ls -b -CF'
fi


# --------------------------------------------------------------------------- #
#			Editor						      #
# --------------------------------------------------------------------------- #

if [[ -x `which vim` ]]; then
	alias vi=`which vim`
fi

# --------------------------------------------------------------------------- #
#			Version Controll Systems			      #
# --------------------------------------------------------------------------- #

if [[ -x `which git` ]]; then
	alias g='git'
fi
