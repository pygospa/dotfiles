### 
### Changing directories
###

# If input no command but directory, auto-cd to that directory
setopt auto_cd

# cd pushes old directory to stack
setopt auto_pushd

# cd arg is not a directory but a variable name, expand it.
setopt cdable_vars

# setting this, for link /foo/bar pointing to /baz/qux, cd /foo/bar/.. will
# set working directory to /baz. Unset it will set it to /foo
# HOWEVER, cd /foo/bar will set working directory to /foo/bar
setopt nochase_dots

# As chase_dots, but setting this will lead cd /foo/bar to working directory
# /baz/qux
setopt nochase_links

# Remove the restrictions by POSIX on cd
setopt noposix_cd

# Don't push multiple copies of same directory onto dir stack
setopt pushd_ignore_dups

# Exchange meanings of '+' and '-' when given  with number to specify directory
setopt nopushed_minus

# Do not print directory stack after pushd or popd
setopt pushd_silent

# Have pushd with no arguments act like 'pushd $HOME'
setopt nopushd_to_home



### 
### Completion
###




### 
### Expansion and Globbing
###

# Don't error out when unset parameters are used
setopt unset

# in order to use #, ~ and ^ for filename generation grep word
# *~(*.gz|*.bz|*.bz2|*.zip|*.Z) -> searches for word not in compressed files
# don't forget to quote '^', '~' and '#'!
setopt extended_glob

 


###
### History
###

# Have all zsh sessions append their history list to the history file instead
# of replacing it.
setopt append_history

# Never used csh shell before, so no idea why, how and if I need this or would
# miss it
setopt nobang_hist

# instead of just the command, save ': <start time>:<elapsed
# seconds>;<command>'
setopt extended_history

# Clobbering = overwriting, using pipes. If clobbering is unset, something like
# echo 'foo' > bar is not permitted when bar exist.
# This setting allows to clobber from histfile (clobbering commands will be
# saved as "echo 'foo' >| bar" and can be executed, even if clobbering is
# not permitted
setopt hist_allow_clobber

# If available use systems fcntl calls that provide better preformance when
# locking history file for writing
setopt hist_fcntl_lock

# When set, commands already in history file will be removed from history and
# added on top
setopt nohist_ignore_all_dups

# Wehn set, commands already in histroy file will not be added again
setopt nohist_ignore_dups

# When scrolling through list of used commands, ignore duplicates
setopt hist_find_no_dups

# When file needs trimming to add new commands, remove oldest dups before
# unique entries
setopt hist_expire_dups_first

# If command is preceeded with a space, it's not logged into history
setopt hist_ignore_space

# If set, function definitions are not saved into history file
setopt nohist_no_functions

# Import new commands form history file from other zsh-sessions (REQUIRES
# append_history)
setopt share_history



### 
### Job Control
###

# Report status of background/suspended jobs before exiting; second try will
# exit shell (use especially with nohup!)
setopt check_jobs

# Don't send SIGHUP to background processes when shell exits.
setopt nohup

# Jobs in long format (i.e. display PID as well when suspending process)
setopt long_list_jobs

# report the status of backgrounds jobs immediately
setopt notify

# Make job control more posix conform
setopt noposix_jobs
