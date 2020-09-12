# Purpose		This file contains host specific settings for my home
#			PC running Gentoo Linux
#
# Author		Kannan Thambiah <pygospa@gmail.com>
# Latest Version	https://github.com/pygospa/dotfiles


#------------------------------------------------------------------------------
# Program aliases
#
alias open='xdg-open'		# I'm used to macOS' open so here we go
alias mplayer_hf='mplayer -ao alsa:device=hw=0,0' # mplayer /w sound on headphones
alias urxvt='urxvtc'		# use the speed-up urxvt demon client system
alias U4Editor='/home/pygospa/repos/UnrealEngine/Engine/Binaries/Linux/UE4Editor -nocore'

#------------------------------------------------------------------------------
# Directory aliases
#
alias slab="cd $HOME/files/slab/"
alias mino="cd $HOME/files/slab/mino4qs/"

#------------------------------------------------------------------------------
# neuland Aliases
#
alias unigro="cd $HOME/files/work/neuland/osecom/unigro"
alias startunigro="cd $HOME/files/work/neuland/osecom/unigro/repo/docker-build/unigro && docker-compose up"
alias frankonia="cd $HOME/files/work/neuland/osecom/frankonia"

#------------------------------------------------------------------------------
# System variables
#
export PATH="$HOME/.gems/bin:$PATH:/opt/cuda/bin"	# Gems, Cuda variables
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/opt/cuda/lib4"
export GEM_HOME="$HOME/.gems/"

#------------------------------------------------------------------------------
# Node NVM
#
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#------------------------------------------------------------------------------
# Ruby RVM
#
source "/etc/profile.d/rvm.sh"
