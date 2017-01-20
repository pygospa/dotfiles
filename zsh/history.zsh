# File			~/.zsh/completion.zsh
#
# Purpose		This file contains all settings and stylings for zsh
#			completion system
#
# Author		Kannan Thambiah <pygospa@gmail.com>
# Latest Version	https://github.com/pygospa/dotfiles
# License		CC BY-SA 4.0, if applicable and compatible to software
#			license



#------------------------------------------------------------------------------
# Variabels
#
HISTFILE=${HOME}/.zsh_history	# Where to save history
HISTSIZE=100000			# No. of lines in history of active session
SAVEHIST=100000			# No. of lines persistantly saved to histfile


#------------------------------------------------------------------------------
# Settings
#

# Have all zsh sessions append their history list to the history file instead
# of replacing it.
setopt append_history

# Backward compatibility to csh, that will forbid bang in history:
# e.g. 'list all files ending not with .c or .h':
#    $ ls *.[!ch]
#    $ zsh: event not found: ch]
#    $ setopt _no_bang_history
#    $ ls *[!ch]
#    1.a 1.o 2.a 2.o
# With bang_hist set one needs to escape the !
#    $ ls *.[\!ch]
setopt no_bang_hist

# instead of just the command, save ': <start time>:<elapsed
# seconds>;<command>'
setopt no_extended_history

# Clobbering = overwriting, using pipes. If clobbering is unset, something like
# echo 'foo' > bar is not permitted when bar exist.
# This setting allows to clobber from histfile (clobbering commands will be
# saved as "echo 'foo' >| bar" and can be executed, even if clobbering is
# not permitted
setopt hist_allow_clobber

# Beep when an attempt is made to access history entry that isn't there
setopt hist_beep

# If available use systems fcntl calls that provide better preformance when
# locking history file for writing
setopt hist_fcntl_lock

# When set, commands already in history file will be removed from history and
# added on top
setopt no_hist_ignore_all_dups

# Wehn set, commands already in histroy file will not be added again
setopt no_hist_ignore_dups

# When scrolling through list of used commands, ignore duplicates
setopt hist_find_no_dups

# When file needs trimming to add new commands, remove oldest dups before
# unique entries
setopt hist_expire_dups_first

# If command is preceeded with a space, it's not logged into history
setopt hist_ignore_space

# If set, function definitions are not saved into history file
setopt no_hist_no_functions

# Remove extra blanks form each command line being added to histroy
setopt hist_reduce_blanks

# Don't execute the history, just expand it so user can verify it first.
setopt hist_verify

# Add commands as they are typed in, and not after shell exits!
setopt inc_append_history

# Import new commands form history file from other zsh-sessions (REQUIRES
# append_history)
setopt share_history



#------------------------------------------------------------------------------
# Key bindings
#


if [[ `uname -s` != Darwin ]]; then
	# Search histroy forward for entry beginning with typed text using 'arrow up'
	bindkey "${key[Up]}"	history-beginning-search-backward

	# Search history backward for entry beginning with typed text using 'arrow down'
	bindkey "${key[Down]}"	history-beginning-search-forward
fi

