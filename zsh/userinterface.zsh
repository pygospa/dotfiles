# File			~/.zsh/userinterface.zsh
#
# Purpose		This file contains all settings regarding working with
#			directories, i.e. listing them, directory completion,
#			shell behaviour when scripting, etc.
#			It basically contains everything that can be summed
#			up as user interface to the system (via the CLI)
#
# Author		Kannan Thambiah <pygospa@gmail.com>
# Latest Version	https://github.com/pygospa/dotfiles
# License		CC BY-SA 4.0, if applicable and compatible to software
#			license



# --------------------------------------------------------------------------- #
#			 Aliases					      #
# --------------------------------------------------------------------------- #

# ls aliases with and without color
if [[ "$TERM" != dumb ]]; then
	# -b = C-Style escapes
	# -C = Columns
	# -d = only directories
	# -F = Append indicator (one of * / = > @ |)
	# -a = All files (including . )
	# -A = Almost all (ignoring . and .. )
	# -l = Long format
	# -h = human readable size
	alias ls=' ls -b -CF '${ls_options:+"${ls_options[*]}"}

	alias l=' ls -l'${ls_options:+"${ls_options[*]}"}
	alias lh=' ls -hAl'${ls_options:+"${ls_options[*]}"}
	alias la=' ls -la '${ls_options:+"${ls_options[*]}"}
	alias lad=' ls -d .*(/)'${ls_options:+"${ls_options[*]}"}
	alias laf=' ls -a .*(.)'${ls_options:+"${ls_options[*]}"}
	alias le=' ls -l *(*)'${ls_options:+"${ls_options[*]}"}
	alias ll=' ls -l *(@)'${ls_options:+"${ls_options[*]}"}
	alias lsd=' ls -d *(/)'${ls_options:+"${ls_options[*]}"}
	alias lse=' ls -d *(/^F)'${ls_options:+"${ls_options[*]}"}
	alias lss='ls -l *(s,S,t)'${ls_options:+"${ls_options[*]}"}
	alias lw=' ls -ld *(R,W,X.^ND/)'${ls_options:+"${ls_options[*]}"}

	alias big=' ls -flh *(.OL[1,10])'${ls_options:+"${ls_options[*]}"}
	alias new=' ls -rtlh *(D.om[1,10])'${ls_options:+"${ls_options[*]}"}
	alias newdir=' ls -rthdl *(/om[1,10]) .*(D/om[1,10])'${ls_options:+"${ls_options[*]}"}
	alias old=' ls -rtlh *(D.Om[1,10])'${ls_options:+"${ls_options[*]}"}
	alias olddir=' ls -rthdl *(/Om[1,10]) .*(D/Om[1,10])'${ls_options:+"${ls_options[*]}"}
	alias small=' ls -Srl *(.oL[1,10])'${ls_options:+"${ls_options[*]}"}

else
	alias ls=' ls -b -CF'		# ls always with escapes, columns and type postfix

	alias l=' ls -l'		# Long with type postfix
	alias lh=' ls -hAl'		# Human readable
	alias la=' ls -la '		# All files (long)
	alias lad=' ls -d .*(/)'	# Only dot directories
	alias laf=' ls -a .*(.)'	# Only dot files
	alias le=' ls -l *(*)'		# Only executables
	alias ll=' ls -l *(@)'		# Only links
	alias lsd=' ls -d *(/)'         # Only directories
	alias lse=' ls -d *(/^F)'	# Only empty directories
	alias lss=' ls -l *(s,S,t)'	# Only with setgid/setuid/sticky
	alias lw=' ls -ld *(R,W,X.^ND/)' # Only Worldfiles

	alias big=' ls -flh *(.OL[1,10])' # 10 biggest files
	alias new=' ls -rtlh *(D.om[1,10])' # 10 newest files + 10 newest directories
	alias newdir=' ls -rthdl *(/om[1,10]) .*(D/om[1,10])'
	alias old=' ls -rtlh *(D.Om[1,10])' # 10 oldest files + 10 oldest directories
	alias olddir=' ls -rthdl *(/Om[1,10]) .*(D/Om[1,10])'
	alias small=' ls -Srl *(.oL[1,10])' # 10 smallest files
fi

# Grep should be colorful
if [[ "$TERM" != dumb ]]; then
	alias grep='grep '${grep_options:+"${grep_options[*]}"}
fi

# print current directory + subdirectories as a tree
alias tree=" ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"

# six levels of shortcuts for cd
alias cd=' cd'
alias ..=' cd ..'
alias ...=' cd ../..'
alias ....=' cd ../../..'
alias .....=' cd ../../../..'
alias ......=' cd ../../../../..'
alias .......=' cd ../../../../../..'

# aliases for du
alias dh=' du -hsc *'

# Sort the files according to size
if [[ `uname -s` == Linux ]]; then
	alias dhs=' du -hsc * | sort -h'
# OS X doesn't know human-readable sort, so here's a workaround for that
elif [[ `uname -s` == Darwin ]]; then
	alias dhs=' du -sckx * | sort -nr | awk '\''
	function human(x) {
		s="kMGTEPYZ";
		while (x>=1000 && length(s)>1){
			x/=1024; s=substr(s,2)
		}
		return (int(x*10)/10) substr(s,1,1)
	}
	{gsub(/^[0-9]+/, human($1)); print}'\'''
fi



# --------------------------------------------------------------------------- #
#			Variables					      #
# --------------------------------------------------------------------------- #

### Changing directories

# If input no command but directory, auto-cd to that directory
setopt auto_cd

# cd pushes old directory to stack
setopt auto_pushd

# if argument to cd is no directory and does not begin with /
# try to expand argument as ~arg:
#      ~ by itself: $HOME
#      ~+/-    current/previous working directory
#      ~n      Position in directory stack
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



### Input/output

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

 
 
### Scripts and Functions

# Implicite tees and cats on multiple redirections. This allows for something like this:
#      cat file1 file2 | mail -s 'all results' joe@foo.net
# to be written like this
#      mail -s 'all results' joe@foo.net <file1 <file2
# or write into many files
#      echo 'Hello world' >a >b        
setopt multios



### Shell Emulation

# Don't supress backslashed escape sequences in echo strings
# Use 'print' to print arbitrary strings!
# e.g. 
#     $ echo "foo\bar\baz"
#     fooaaz
#     $ setopt bsd_echo
#     $ echo "foo\bar\baz"
#     foo\bar\baz
setopt no_bsd_echo



### Zle

# I HATE beeping!
setopt no_beep

