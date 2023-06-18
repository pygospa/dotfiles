# Purpose           This file contains host specific settings for my home
#                   PC running ~Gentoo Linux~ Arch Linux
#
# Author            Kannan Thambiah <pygospa@gmail.com>
# Latest Version    https://github.com/pygospa/dotfiles


#------------------------------------------------------------------------------
# Program aliases
#
alias open='xdg-open'		# I'm used to macOS' open so here we go
alias mplayer_hf='mplayer -ao alsa:device=hw=0,0' # mplayer /w sound on headphones
alias urxvt='urxvtc'		# use the speed-up urxvt demon client system
alias U4Editor='/home/pygospa/repos/UnrealEngine/Engine/Binaries/Linux/UE4Editor -nocore'
alias mutt='neomutt'
alias makemkv='/var/lib/flatpak/exports/bin/com.makemkv.MakeMKV'


#------------------------------------------------------------------------------
# Directory aliases
#
alias slab="cd $HOME/files/slab/"
alias aur="cd $HOME/files/sw/linux/arch/aur"
alias bbdc="cd $HOME/files/edu/bbdc/2022 && export ZSH_VCS_PROMPT_MERGE_BRANCH=main"
alias mino="cd $HOME/files/slab/mino4qs && export ZSH_VCS_PROMPT_MERGE_BRANCH=main && source ./venv/bin/activate"
alias tcgdb="cd $HOME/files/slab/tcgdb && source ./backend/.venv/bin/activate"


#------------------------------------------------------------------------------
# neuland aliases
#
alias unigro="cd $HOME/files/work/neuland/osecom/unigro"
alias witt="cd $HOME/files/work/neuland/osecom/witt"
alias startunigro="cd $HOME/files/work/neuland/osecom/unigro/repo/docker-build/unigro && docker-compose up"
alias frankonia="cd $HOME/files/work/neuland/osecom/frankonia"

alias obi="cd $HOME/files/work/neuland/obi"
export GITLAB_READ_OBI_DBS_REGISTRY='glpat-HRKKYR-hnUbGQ-Czyykm'

#------------------------------------------------------------------------------
# System variables
#
source /usr/share/jenv-git/init-jenv.sh
export PATH="$HOME/.gems/bin:$PATH:/opt/cuda/bin"	# Gems, Cuda variables
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/opt/cuda/lib4"
export GEM_HOME="$HOME/.gems"


#------------------------------------------------------------------------------
# Node NVM
#
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


#------------------------------------------------------------------------------
# Ruby RVM
#
export PATH="$PATH:$HOME/.rvm"


#------------------------------------------------------------------------------
# pyenv
#
export PATH PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

#------------------------------------------------------------------------------
# Go
#

if [[ -x `which -p go` ]]; then
	export GOPATH="$HOME/slab/go"
#	export GOBIN="$HOME/slab/ws/go/bin"
#	export GOROOT="/usr/local/opt/go/libexec"
	export PATH="$PATH:$GOPATH/bin"
fi

#------------------------------------------------------------------------------
# Rust
#
export PATH CARGO_BIN="$HOME/.cargo/bin"
export PATH="$CARGO_BIN:$PATH"
