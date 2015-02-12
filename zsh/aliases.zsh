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

# LS aliases
if [[ "$TERM" != dumb ]]; then
	# -b = C-Style escapes
	# -C = Columns
	# -F = Append indicator (one of * / = > @ |)
	# -a = All files (including . )
	# -A = Almost all (ignoring . and .. )
	# -l = Long format
	# -h = human readable size
	alias l='ls -lF '${ls_options:+"${ls_options[*]}"}	
	alias la='ls -la '${ls_options:+"${ls_options[*]}"}
	alias lh='ls -hAl '${ls_options:+"${ls_options[*]}"}
	alias ll='ls -l '${ls_options:+"${ls_options[*]}"}
	alias ls='ls -b -CF '${ls_options:+"${ls_options[*]}"}
else
	alias l='ls -lF'
	alias la='ls -la'
	alias lh='ls -hAl'
	alias ll='ls -l'
	alias ls='ls -b -CF'
fi

# --------------------------------------------------------------------------- #
#			Editor						      #
# --------------------------------------------------------------------------- #

if [[ -x `which vim` ]]; then
	alias vi=`which vim`
fi

# --------------------------------------------------------------------------- #
#			Version Controll Systems			      #
# --------------------------------------------------------------------------- #

if [[ -x `which git` ]]; then
	alias g='git'
fi

# --------------------------------------------------------------------------- #
#			System Specific					      #
# --------------------------------------------------------------------------- #

# On my Gentoo Linux run 'eisdrache' machine
if [[ `uname -n` == eisdrache ]]; then
	# Start mplayer with surround sound activated
	alias surround='mplayer -ao alsa:device=plug=surround51 -channels 6'
	# Start TV on mplayer with names for channels
	alias fernseher='mplayer -tv driver=v4l2:chanlist=europe-west:channels=E6-ard,E8-zdf,E7-ndr,E10-sat1,SE18-rtl,E12-rtl2,E11-pro7,SE9-kabel1,SE10-vox,SE17-br,SE11-3sat,SE15-mdr,SE6-arte,SE14-n24,SE8-phoenix,SE7-mtv,SE12-viva,22-dasvierte,S22-dmax,S23-superrtl,SE16-kika,E9-kieltv,SE13-sport1,SE20-9live,S21-eurosport,S35-qvc,21-dr1:alsa:adevice=hw.1,0:amode=1:audiorate=32000:forceaudio:immediatemode=0:volume=100:norm=PAL:tdevice=/dev/vbi0 -vo gl2'
fi

# On Macs in general
if [[ `uname -s` == Darwin ]]; then
	# Set easy to use commands for starting and stoping postgresql if
	# available on system
	if [[ -x `which pg_ctl` ]]; then
		alias pg-start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
		alias pg-stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
	fi
fi
