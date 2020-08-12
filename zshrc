# Purpose		main configuration file for the Z-Shell
# 			Tests and sources sub-config files if available or
# 			notifies user if not available.
# 			"Explicite is better than implicite" - so everything is
# 			configured explicitly (e.g. Path, etc).
# 			Keep that in mind!
# Author		Kannan Thambiah <pygospa@gmail.com>
# Latest Version	https://github.com/pygospa/dotfiles


#------------------------------------------------------------------------------
# Machine INDEPENDANT configuration files
#

# Keyboard settings, so that function keys work independantly from the term
# (needed as zsh does not use /etc/inputrc)
if [ -f ~/.zsh/keys.zsh ]; then
	source ~/.zsh/keys.zsh
else
	printf "Note ~/.zsh/keys.zsh is unavailable\n"
fi

# Environment variables, such as $PATH, $EDITOR, $PAGER, etc.
if [ -f ~/.zsh/envvars.zsh ]; then
	source ~/.zsh/envvars.zsh
else
	printf "Note ~/.zsh/envvars.zsh is unavailable!\n"
fi

# Color settings
if [ -f ~/.zsh/colors.zsh ]; then
	source ~/.zsh/colors.zsh
else
	printf "Note ~/.zsh/colors.zsh is unavailable\n"
fi

# System Prompt Settings
if [ -f ~/.zsh/prompt.zsh ]; then
	source ~/.zsh/prompt.zsh
else
	print "Note: ~/.zsh/prompt.zsh is unavailable\n"
fi

# File system navigation tool settings and aliases for easier navigation and
# getting directory information
if [ -f ~/.zsh/ui.zsh ]; then
	source ~/.zsh/ui.zsh
else
	printf "Note ~/.zsh/ui.zsh\n"
fi

# Completion settings
if [ -f ~/.zsh/completion.zsh ]; then
	source ~/.zsh/completion.zsh
else
	printf "Note ~/.zsh/completion.zsh is unavailable\n"
fi

# History settings
if [ -f ~/.zsh/history.zsh ]; then
	source ~/.zsh/history.zsh
else
	printf "Note ~/.zsh/history.zsh is unavailable\n"
fi

# GIT/Mercurial settings
if [ -f ~/.zsh/dvcs.zsh ]; then
	source ~/.zsh/dvcs.zsh
else
	print "Note: ~/.zsh/dvcs.zsh is unavailable\n"
fi

# Title settings
if [ -f ~/.zsh/title.zsh ]; then
	source ~/.zsh/title.zsh
else
	print "Note: ~/.zsh/title.zsh is unavailable\n"
fi



#------------------------------------------------------------------------------
# Machine DEPENDANT configuration files
#

# File to source, if it is a macOS device
if [[ `uname -s` == Darwin ]]; then
	if [ -f ~/.zsh/hosts/darwin.zsh ]; then
		source ~/.zsh/hosts/darwin.zsh
	else
		printf "Note: Running on OS X, but ~/.zsh/darwin.zsh is \
			unavailable\n"
	fi
fi

# Files to source if it's my old home PC 'eisdrache'
if [[ `uname -n` == eisdrache ]]; then
	if [ -f ~/.zsh/hosts/eisdrache.zsh ]; then
		source ~/.zsh/hosts/eisdrache.zsh
	else
		printf "Note: Running on eisdrache, but ~/.zsh/eisdrache.zsh \
			is unavailable\n"
	fi
fi

# File to source if it's my new home PC 'ancalagon'
if [[ `uname -n` == ancalagon ]]; then
	if [ -f ~/.zsh/hosts/ancalagon.zsh ]; then
		source ~/.zsh/hosts/ancalagon.zsh
	else
		printf "Note: Running on ancalagon, but ~/.zsh/ancalagon.zsh \
			is unavailable\n"
	fi
fi

# File to source if it's my work laptop 'stephen-hawking'
if [[ `uname -n` == stephen-hawking ]]; then
	if [ -f ~/.zsh/hosts/stephen-hawking.zsh ]; then
		source ~/.zsh/hosts/stephen-hawking.zsh
	else
		printf "Note: Running on stephen-hawking, but ~/.zsh/stephen-hawking.zsh \
			is unavailable\n"
	fi
fi


#------------------------------------------------------------------------------
# Load custom executable functions
#
for function in ~/.zsh/functions/*; do
	source $function
done


#------------------------------------------------------------------------------
# Software settings
#

# Use funtoos keychain application to manage ssh-agents and gpg-agents
if [[ -x `which -p keychain` ]]; then
	# if on macOS, use '--inherit any' to inherit any ssh key passphrases
	# stored in macOS Keychain app. Omit if not wanted/needed
	if [[ `uname -n` == nienor ]]; then
		# Laptop; could be stolen, or people gain access in an unwary
		# second. Therefore short cache time for key passwords
		eval `keychain --eval --inherit any --timeout 60 id_rsa` # + GPG key
	elif [[ `uname -n` == ancalagon ]]; then
		# My home pc; no one else has physical acces to it, so it is
		# save to keep keys in cache longer
		eval `keychain --eval --timeout 300 id_rsa` # + GPG key
	else
		# What other PCs are there?!
		eval `keychain --eval --timeout 15 id_rsa` # + GPG key
	fi
fi

# Load nvm file if available
if [[ `command -v nvm` == nvm ]]; then
	if [ -f ~/.zsh/nvm.zsh ]; then
		source ~/.zsh/nvm.zsh
	else
		printf "Note: nvm is installed, but ~/.zsh/nvm.zsh is unavailable\n"
	fi
fi

## Python settings
#if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
#
