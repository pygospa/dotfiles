# File			~/.zsh/completion.zsh
#
# Purpose		This file contains all settings and stylings for zsh
#			completion system
#
# Author		Kannan Thambiah <pygospa@gmail.com>
# Latest Version	https://github.com/pygospa/dotfiles
# License		CC BY-SA 4.0, if applicable and compatible to software
#			license



# --------------------------------------------------------------------------- #
#			Modules						      #
# --------------------------------------------------------------------------- #


autoload -U compinit && compinit -u || print 'compinit not available!'



# --------------------------------------------------------------------------- #
#			Settings					      #
# --------------------------------------------------------------------------- #


### Completion

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
setopt no_list_packed

# When listing files that are possible completions, show type of file with
# trailing identifying mark
setopt list_types



### Expansion and Globbing

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
setopt no_glob_dots

# If pattern for filename generation has no match, delete pattern from argument
# list and go on instead of exiting with an error
setopt null_glob
 
# Don't error out when unset parameters are used
setopt unset



# --------------------------------------------------------------------------- #
#			Styling						      #
# --------------------------------------------------------------------------- #

# allow one error for every three characters typed in approximate completer
zstyle ':completion:*:approximate:'    max-errors 'reply=( $((($#PREFIX+$#SUFFIX)/3 )) numeric )'

# don't complete backup files as executables
zstyle ':completion:*:complete:-command-::commands' ignored-patterns '(aptitude-*|*\~)'

# start menu completion only if it could find no unambiguous initial string
zstyle ':completion:*:correct:*'       insert-unambiguous true
zstyle ':completion:*:corrections'     format $'%{\e[0;31m%}%d (errors: %e)%{\e[0m%}'
zstyle ':completion:*:correct:*'       original true

# activate color-completion
zstyle ':completion:*:default'         list-colors ${(s.:.)LS_COLORS}

# format on completion
zstyle ':completion:*:descriptions'    format $'%{\e[0;31m%}completing %B%d%b%{\e[0m%}'

# automatically complete 'cd -<tab>' and 'cd -<ctrl-d>' with menu
# zstyle ':completion:*:*:cd:*:directory-stack' menu yes select

# insert all expansions for expand completer
zstyle ':completion:*:expand:*'        tag-order all-expansions
zstyle ':completion:*:history-words'   list false

# activate menu
zstyle ':completion:*:history-words'   menu yes

# ignore duplicate entries
zstyle ':completion:*:history-words'   remove-all-dups yes
zstyle ':completion:*:history-words'   stop yes

# match uppercase from lowercase
zstyle ':completion:*'                 matcher-list 'm:{a-z}={A-Z}'

# separate matches into groups
zstyle ':completion:*:matches'         group 'yes'
zstyle ':completion:*'                 group-name ''

if [[ "$NOMENU" -eq 0 ]] ; then
	# if there are more than 5 options allow selecting from a menu
	zstyle ':completion:*'               menu select=5
else
	# don't use any menus at all
	setopt no_auto_menu
fi

zstyle ':completion:*:messages'        format '%d'
zstyle ':completion:*:options'         auto-description '%d'

# describe options in full
zstyle ':completion:*:options'         description 'yes'

# on processes completion complete all user processes
zstyle ':completion:*:processes'       command 'ps -au$USER'

# offer indexes before parameters in subscripts
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# provide verbose completion information
zstyle ':completion:*'                 verbose true

# recent (as of Dec 2007) zsh versions are able to provide descriptions
# for commands (read: 1st word in the line) that it will list for the user
# to choose from. The following disables that, because it's not exactly fast.
zstyle ':completion:*:-command-:*:'    verbose false

# set format for warnings
zstyle ':completion:*:warnings'        format $'%{\e[0;31m%}No matches for:%{\e[0m%} %d'

# define files to ignore for zcompile
zstyle ':completion:*:*:zcompile:*'    ignored-patterns '(*~|*.zwc)'
zstyle ':completion:correct:'          prompt 'correct to: %e'

# Ignore completion functions for commands you don't have:
zstyle ':completion::(^approximate*):*:functions' ignored-patterns '_*'

# Provide more processes in completion of programs like killall:
zstyle ':completion:*:processes-names' command 'ps c -u ${USER} -o command | uniq'

# complete manual by their section
zstyle ':completion:*:manuals'    separate-sections true
zstyle ':completion:*:manuals.*'  insert-sections   true
zstyle ':completion:*:man:*'      menu yes select

# Search path for sudo completion
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin \
	/usr/local/bin  \
	/usr/sbin       \
	/usr/bin        \
	/sbin           \
	/bin            \
	/usr/X11R6/bin

# provide .. as a completion
zstyle ':completion:*' special-dirs ..

# try to be smart about when to use what completer...
setopt correct
zstyle -e ':completion:*' completer '
if [[ $_last_try != "$HISTNO$BUFFER$CURSOR" ]] ; then
	_last_try="$HISTNO$BUFFER$CURSOR"
	reply=(_complete _match _ignored _prefix _files)
else
	if [[ $words[1] == (rm|mv) ]] ; then
		reply=(_complete _files)
	else
		reply=(_oldlist _expand _force_rehash _complete _ignored _correct _approximate _files)
	fi
fi'

# command for process lists, the local web server details and host completion
zstyle ':completion:*:urls' local 'www' '/var/www/' 'public_html'

# caching
[[ -d $ZSHDIR/cache ]] && zstyle ':completion:*' use-cache yes && \
	zstyle ':completion::complete:*' cache-path $ZSHDIR/cache/

# host completion
[[ -r ~/.ssh/known_hosts ]] && _ssh_hosts=(${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[\|]*}%%\ *}%%,*}) || _ssh_hosts=()
[[ -r /etc/hosts ]] && : ${(A)_etc_hosts:=${(s: :)${(ps:\t:)${${(f)~~"$(</etc/hosts)"}%%\#*}##[:blank:]#[^[:blank:]]#}}} || _etc_hosts=()
hosts=(
$(hostname)
"$_ssh_hosts[@]"
"$_etc_hosts[@]"
localhost
)
zstyle ':completion:*:hosts' hosts $hosts
# TODO: so, why is this here?
#  zstyle '*' hosts $hosts

# use generic completion system for programs not yet defined; (_gnu_generic works
# with commands that provide a --help option with "standard" gnu-like output.)
for compcom in cp deborphan df feh fetchipac head hnb ipacsum mv \
	pal stow tail uname ; do
	[[ -z ${_comps[$compcom]} ]] && compdef _gnu_generic ${compcom}
done; unset compcom
    
# run rehash on completion so new installed program are found automatically:
_force_rehash() {
	(( CURRENT == 1 )) && rehash
	return 1
}

# see upgrade function in this file
compdef _hosts upgrade
