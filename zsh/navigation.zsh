# File			~/.zsh/navigation.zsh
#
# Purpose		navigation related settings and aliases
#
# Author		Kannan Thambiah <pygospa@gmail.com>
# Latest Version	https://github.com/pygospa/dotfiles
# License		CC BY-SA 4.0, if applicable and compatible to software
#			license


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
	alias grep='grep'${grep_options:+"${grep_options[*]}"}
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


