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
