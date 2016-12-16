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
#			 Modules					      #
# --------------------------------------------------------------------------- #

autoload -U zmv
autoload -U zed

# Load a few more functions and tie them to widgets, so they can be bound:
autoload -U insert-file && zle -N insert-file
autoload -U edit-command-line && zle -N edit-command-line
autoload -U insert-unicode-char && zle -N insert-unicode-char



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

	alias l=' ls -l '${ls_options:+"${ls_options[*]}"}
	alias lh=' ls -hAl '${ls_options:+"${ls_options[*]}"}
	alias la=' ls -la '${ls_options:+"${ls_options[*]}"}
	alias lad=' ls -d .*(/) '${ls_options:+"${ls_options[*]}"}
	alias laf=' ls -a .*(.) '${ls_options:+"${ls_options[*]}"}
	alias le=' ls -l *(*) '${ls_options:+"${ls_options[*]}"}
	alias ll=' ls -l *(@) '${ls_options:+"${ls_options[*]}"}
	alias lsd=' ls -d *(/) '${ls_options:+"${ls_options[*]}"}
	alias lse=' ls -d *(/^F) '${ls_options:+"${ls_options[*]}"}
	alias lss='ls -l *(s,S,t) '${ls_options:+"${ls_options[*]}"}
	alias lw=' ls -ld *(R,W,X.^ND/) '${ls_options:+"${ls_options[*]}"}

	alias big=' ls -flh *(.OL[1,10]) '${ls_options:+"${ls_options[*]}"}
	alias new=' ls -rtlh *(D.om[1,10]) '${ls_options:+"${ls_options[*]}"}
	alias newdir=' ls -rthdl *(/om[1,10]) .*(D/om[1,10]) '${ls_options:+"${ls_options[*]}"}
	alias old=' ls -rtlh *(D.Om[1,10]) '${ls_options:+"${ls_options[*]}"}
	alias olddir=' ls -rthdl *(/Om[1,10]) .*(D/Om[1,10]) '${ls_options:+"${ls_options[*]}"}
	alias small=' ls -Srl *(.oL[1,10]) '${ls_options:+"${ls_options[*]}"}

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

# diff should be colorful
if [[ `command -v colordiff` ]]; then
	alias diff='colordiff'
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
#			Options						      #
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


### Job control
 
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




# --------------------------------------------------------------------------- #
#			Auxilliary functions				      #
# --------------------------------------------------------------------------- #


# Create small urls via http://goo.gle using curl(1).
# API reference: https://code.google.com/apis/urlshortener
function zu() {
    emulate -L zsh
    setopt extended_glob

    if [[ -z $1 ]]; then
        print "USAGE: zurl <URL>"
        return 1
    fi

    local PN url prog api json contenttype item
    local -a data
    PN=$0
    url=$1

    # Prepend 'http://' to given URL where necessary for later output.
    if [[ ${url} != http(s|)://* ]]; then
        url='http://'${url}
    fi

    if [[ -x `which curl` ]]; then
        prog=curl
    else
        print "curl is not available, but mandatory for ${PN}. Aborting."
        return 1
    fi
    api='https://www.googleapis.com/urlshortener/v1/url'
    contenttype="Content-Type: application/json"
    json="{\"longUrl\": \"${url}\"}"
    data=(${(f)"$($prog --silent -H ${contenttype} -d ${json} $api)"})
    # Parse the response
    for item in "${data[@]}"; do
        case "$item" in
            ' '#'"id":'*)
                item=${item#*: \"}
                item=${item%\",*}
                printf '%s\n' "$item"
                return 0
                ;;
        esac
    done
    return 1
}

# Create Directoy and \kbd{cd} to it
mkcd() {
    if (( ARGC != 1 )); then
        printf 'usage: mkcd <new-directory>\n'
        return 1;
    fi
    if [[ ! -d "$1" ]]; then
        command mkdir -p "$1"
    else
        printf '`%s'\'' already exists: cd-ing.\n' "$1"
    fi
    builtin cd "$1"
}

# grep for running process, like: 'any vim'
any() {
    emulate -L zsh
    unsetopt KSH_ARRAYS
    if [[ -z "$1" ]] ; then
        echo "any - grep for process(es) by keyword" >&2
        echo "Usage: any <process_name>" >&2 ; return 1
    else
        ps xauwww | grep -i "${grep_options[@]}" "[${1[1]}]${1[2,-1]}"
    fi
}

# cd to directory and list files
cdls() {
    emulate -L zsh
    cd $1 && ls -a
}

# List files which have been accessed within the last {\it n} days, {\it n} defaults to 1
accessed() {
    emulate -L zsh
    print -l -- *(a-${1:-1})
}

# List files which have been changed within the last {\it n} days, {\it n} defaults to 1
changed() {
    emulate -L zsh
    print -l -- *(c-${1:-1})
}

# List files which have been modified within the last {\it n} days, {\it n} defaults to 1
modified() {
    emulate -L zsh
    print -l -- *(m-${1:-1})
}

# If there's an env.sh file in the directory you're changing into, it gets
# sourced. Ideal if you e.g. work with different instances of ROCK
# (http://rock-robotics.org/stable/)
function autosource {
	if [[ -s "$PWD/env.sh" ]] && [[ -r "$PWD/env.sh" ]]; then
		source "$PWD/env.sh"
		echo -e "\033[0;31m ! Autosourced $PWD/env.sh ! \033[0m"
	fi
}
chpwd_functions=( "${chpwd_functions[@]}" autosource )



# Most awesome function to have in your zshrc!
# Thx to anon (http://stackoverflow.com/questions/171563/whats-in-your-zshrc/904023#904023)
function mandelbrot {
   local lines columns colour a b p q i pnew
   ((columns=COLUMNS-1, lines=LINES-1, colour=0))
   for ((b=-1.5; b<=1.5; b+=3.0/lines)) do
       for ((a=-2.0; a<=1; a+=3.0/columns)) do
           for ((p=0.0, q=0.0, i=0; p*p+q*q < 4 && i < 32; i++)) do
               ((pnew=p*p-q*q+a, q=2*p*q+b, p=pnew))
           done
           ((colour=(i/4)%8))
            echo -n "\\e[4${colour}m "
        done
        echo
    done
}

