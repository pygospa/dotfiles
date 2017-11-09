# Purpose		This file contains host specific settings for my home
#			PC running Gentoo Linux
#
# Author		Kannan Thambiah <pygospa@gmail.com>
# Latest Version	https://github.com/pygospa/dotfiles


#------------------------------------------------------------------------------
# Aliases
#
alias open='xdg-open'		# I'm used to macOS' open so here we go
alias mplayer_hf='mplayer -ao alsa:device=hw=0,0' # mplayer /w sound on headphones
alias urxvt='urxvtc'		# use the speed-up urxvt demon client system
alias U4Editor='/home/pygospa/repos/UnrealEngine/Engine/Binaries/Linux/UE4Editor -nocore'



#------------------------------------------------------------------------------
# System variables
#
export PATH="$PATH:/opt/cuda/bin"	# Cuda variables
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/opt/cuda/lib4"
