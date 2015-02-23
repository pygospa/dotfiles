### 
### Changing directories
###

# If input no command but directory, auto-cd to that directory
setopt auto_cd

# cd pushes old directory to stack
setopt auto_pushd

# if argument to cd is no directory and does not begin with /
# try to expand argument as ~arg:
#	~ by itself: $HOME
#	~+/-	current/previous working directory
#	~n	Position in directory stack
setopt cdable_vars

# setting this, for link /foo/bar pointing to /baz/qux, cd /foo/bar/.. will
# set working directory to /baz. Unset it will set it to /foo
# HOWEVER, cd /foo/bar will set working directory to /foo/bar
setopt no_chase_dots

# As chase_dots, but setting this will lead cd /foo/bar to working directory
# /baz/qux
setopt no_chase_links

# Remove the restrictions by POSIX on cd
setopt no_posix_cd

# Don't push multiple copies of same directory onto dir stack
setopt pushd_ignore_dups

# Exchange meanings of '+' and '-' when given  with number to specify directory
# in stack
setopt no_pushd_minus

# Do not print directory stack after pushd or popd
setopt pushd_silent

# Have pushd with no arguments act like 'pushd $HOME'
setopt no_pushd_to_home



### 
### Completion
###

# Completion in middle of word will move cursor to end of word
setopt always_to_end

# Automatically list choices on an ambiguous completion
setopt auto_list

# Any parameter set to absolute name of a directory immediately becomes the
# name for that directory (e.g. in the prompt)
setopt no_auto_name_dirs

# Automatically use menu completion after second consecutive completion request

# Expand expressions in braches which would not undergo brace expansion.
# e.g.
#     $ print 1{abw-z}2
#     1{abw-z}2
#     $ setopt brace_ccl
#     $ print 1{abw-z}2
#     1a2 1b2 1w2 1x2 1y2 1z2
setopt brace_ccl

# Complete in word (to both directions) not only at end of word
setopt complete_in_word

# Hash entire command path before execution - slow on first, but faster ever
# after
setopt hash_list_all

# beep on ambiguous completion, forceing return status 1 - beeps only if BEEP
# option is set
setopt list_beep

# instead of fixed column size for all colums, use individual sizes to make
# completion list smaller (i.e. occupying less lines)
setopt list_packed

# When listing files that are possible completions, show type of file with
# trailing identifying mark
setopt list_types


### 
### Expansion and Globbing
###

# Use '=' expansion, to extend '=cmd' to the path of the cmd
# e.g.
#     $ echo =ls
#     =ls
#     $ setopt equals
#     $ echo =ls
#     /bin/ls
setopt equals

# in order to use #, ~ and ^ for filename generation grep word
# *~(*.gz|*.bz|*.bz2|*.zip|*.Z) -> searches for word not in compressed files
# don't forget to quote '^', '~' and '#'!
setopt extended_glob

# Do not require leading '.' in filename to be matched explicitly
setopt glob_dots

# If pattern for filename generation has no match, delete pattern from argument
# list and go on instead of exiting with an error
setopt null_glob
 
# Don't error out when unset parameters are used
setopt unset




###
### History
###

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

# Add commands as they are typed in, and not after shell exits!
setopt inc_append_history

# If set, function definitions are not saved into history file
setopt no_hist_no_functions

# Remove extra blanks form each command line being added to histroy
setopt hist_reduce_blanks

# Don't execute the history, just expand it so user can verify it first.
setopt hist_verify

# Import new commands form history file from other zsh-sessions (REQUIRES
# append_history)
setopt share_history



### 
### Input/output
###

# When spelling mistake on command, offer correction
setopt correct

# When spelling mistake on argument, offer correction
setopt correct_all

# If this option is unset, output flow control via start/stop characters
# (usually assigned to ^S/^Q) disabled in the shell's editor.
unsetopt flow_control

# In command line, treat lines starting with '#' as comment, not as part of
# command name
# e.g.
#     $ uname # print system information
#     zsh: bad pattern: #
#     $ setopt interactive_comments
#     $ uname # print system information
#     Linux
setopt interactive_comments

# Always search the path, never hash commands
setopt no_hash_cmds

# Query user before executing 'rm *' or 'rm path/*'
# Avoide with expanding * pressing tab!
setopt no_rm_star_silent

# Wait 10 seconds and ignore answers till then, when rm *
# Avoide with expanding * pressing tab!
setopt rm_star_wait
# Allow the short forms of for, select, if, and function constructs, i.
# e.: ``for i (*.o) rm $i'' instead of ``for i in *.o; do rm $i; done''
setopt shortloops




### 
### Job Control
###
 
# Do not run all background jobs at a lower priority
setopt no_bgnice 

# Report status of background/suspended jobs before exiting; second try will
# exit shell (use especially with nohup!)
setopt check_jobs

# Don't send SIGHUP to background processes when shell exits.
setopt no_hup

# Jobs in long format (i.e. display PID as well when suspending process)
setopt long_list_jobs

# report the status of backgrounds jobs immediately
setopt notify

# Make job control more posix conform
setopt no_posix_jobs



### 
### Prompting
### 

# Only show the right prompt on the current prompt line and remove it from
# previous ones
setopt transient_rprompt

# Print carriage return before printing prompt in line editor
# e.g.
#    $ echo -n foo
#    foo%
#    $ setopt nopromptcr
#    $ echo -n foo
#    foo$ ls
setopt prompt_cr


###
### Scripts and Functions
###

# Implicite tees and cats on multiple redirections. This allows for something like this:
# 	cat file1 file2 | mail -s 'all results' joe@foo.net
# to be written like this
#	mail -s 'all results' joe@foo.net <file1 <file2
# or write into many files
#	echo 'Hello world' >a >b	
setopt multios



### 
### Shell Emulation
###

# Don't supress backslashed escape sequences in echo strings
# Use 'print' to print arbitrary strings!
# e.g. 
#     $ echo "foo\bar\baz"
#     fooaaz
#     $ setopt bsd_echo
#     $ echo "foo\bar\baz"
#     foo\bar\baz
setopt no_bsd_echo

###
### Zle
###

# I HATE beeping!
setopt no_beep
