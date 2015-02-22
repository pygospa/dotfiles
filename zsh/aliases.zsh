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

# ls aliases with and without color
if [[ "$TERM" != dumb ]]; then
	# -b = C-Style escapes
	# -C = Columns
	# -F = Append indicator (one of * / = > @ |)
	# -a = All files (including . )
	# -A = Almost all (ignoring . and .. )
	# -l = Long format
	# -h = human readable size
	alias l=' ls -lF '${ls_options:+"${ls_options[*]}"}	
	alias la=' ls -la '${ls_options:+"${ls_options[*]}"}
	alias lh=' ls -hAl '${ls_options:+"${ls_options[*]}"}
	alias ll=' ls -l '${ls_options:+"${ls_options[*]}"}
	alias ls=' ls -b -CF '${ls_options:+"${ls_options[*]}"}
else
	alias l=' ls -lF'
	alias la=' ls -la'
	alias lh=' ls -hAl'
	alias ll=' ls -l'
	alias ls=' ls -b -CF'
fi

# Grep should be colorful
if [[ "$TERM" != dumb ]]; then
	alias grep=' grep '${grep_options:+"${grep_options[*]}"}
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
#			Editor, Pager, etc.				      #
# --------------------------------------------------------------------------- #

# vi should point to vim
if [[ -x `which vim` ]]; then
	alias vi=`which vim`
fi

# Set less and zless to point to vimpager, if vimpager is installed
if [[ -x `which vimpager` ]]; then
	alias less=$PAGER
	alias zless=$PAGER
fi



# --------------------------------------------------------------------------- #
#			Version Controll Systems			      #
# --------------------------------------------------------------------------- #

# I am a lazy bum
if [[ -x `which git` ]]; then
	alias g='git'
fi

# --------------------------------------------------------------------------- #
#			System Specific					      #
# --------------------------------------------------------------------------- #

# On my Gentoo Linux run 'eisdrache' machine
if [[ `uname -n` == eisdrache ]]; then
	# Start mplayer with surround sound activated
	alias m51='mplayer -ao alsa:device=plug=surround51 -channels 6'
	# Start TV on mplayer with names for channels
	alias tv='mplayer -tv driver=v4l2:chanlist=europe-west:channels=E6-ard,E8-zdf,E7-ndr,E10-sat1,SE18-rtl,E12-rtl2,E11-pro7,SE9-kabel1,SE10-vox,SE17-br,SE11-3sat,SE15-mdr,SE6-arte,SE14-n24,SE8-phoenix,SE7-mtv,SE12-viva,22-dasvierte,S22-dmax,S23-superrtl,SE16-kika,E9-kieltv,SE13-sport1,SE20-9live,S21-eurosport,S35-qvc,21-dr1:alsa:adevice=hw.1,0:amode=1:audiorate=32000:forceaudio:immediatemode=0:volume=100:norm=PAL:tdevice=/dev/vbi0 -vo gl2'
fi

# On Macs in general
if [[ `uname -s` == Darwin ]]; then

	# Toggle Finder to show hidden files
	alias show_hidden=' defaults write com.apple.finder AppleShowAllFiles -boolean true ; killall Finder'
	alias hide_hidden=' defaults write com.apple.finder AppleShowAllFiles -boolean false ; killall Finder'

	# Set easy to use commands for starting and stoping postgresql if
	# available on system
	if [[ -x `which pg_ctl` ]]; then
		alias pg-start=' pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
		alias pg-stop=' pg_ctl -D /usr/local/var/postgres stop -s -m fast'
	fi

fi
