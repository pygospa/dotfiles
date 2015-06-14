#File			~/.zsh/ancalagon.zsh
#
# Purpose		This file contains host specific settings for my home
#			PC running Gentoo Linux
#
# Author		Kannan Thambiah <pygospa@gmail.com>
# Latest Version	https://github.com/pygospa/dotfiles
# License		CC BY-SA 4.0, if applicable and compatible to software
#			license

# Start mplayer with sound output on headphones
alias mplayer_hf='mplayer -ao alsa:device=hw=0,0'

# Make use of the speed up urxvt demon and client system
alias urxvt='urxvtc'

export PATH="$PATH:/opt/cuda/bin"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/opt/cuda/lib4"

