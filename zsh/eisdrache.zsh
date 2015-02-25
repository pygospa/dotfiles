# File			~/.zsh/eisdrache.zsh
#
# Purpose		This file contains host specific settings for my home pc running 
#			Gentoo Linux
#
# Author		Kannan Thambiah <pygospa@gmail.com>
# Latest Version	https://github.com/pygospa/dotfiles
# License		CC BY-SA 4.0, if applicable and compatible to software
#			license

# Start mplayer with surround sound activated
alias m51='mplayer -ao alsa:device=plug=surround51 -channels 6'

# Start TV on mplayer with names for channels
alias tv='mplayer -tv driver=v4l2:chanlist=europe-west:channels=E6-ard,E8-zdf,E7-ndr,E10-sat1,SE18-rtl,E12-rtl2,E11-pro7,SE9-kabel1,SE10-vox,SE17-br,SE11-3sat,SE15-mdr,SE6-arte,SE14-n24,SE8-phoenix,SE7-mtv,SE12-viva,22-dasvierte,S22-dmax,S23-superrtl,SE16-kika,E9-kieltv,SE13-sport1,SE20-9live,S21-eurosport,S35-qvc,21-dr1:alsa:adevice=hw.1,0:amode=1:audiorate=32000:forceaudio:immediatemode=0:volume=100:norm=PAL:tdevice=/dev/vbi0 -vo gl2'

