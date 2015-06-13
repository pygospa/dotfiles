# File			~/.zsh/prompt.zsh
#
# Purpose		Everything prompt related is set in this file
#
# Author		Kannan Thambiah <pygospa@gmail.com>
# Latest Version	https://github.com/pygospa/dotfiles
# License		CC BY-SA 4.0, if applicable and compatible to software
#			license


# --------------------------------------------------------------------------- #
#			Settings					      #
# --------------------------------------------------------------------------- #

# Only show the right prompt on the current prompt line and remove it from
# previous ones
setopt transient_rprompt

# Print carriage return before printing prompt in line editor
# e.g.
#    $ echo -n foo
#    foo%
#    $ setopt nopromptcr
#    $ echo -n foo
#    foo$ ls
setopt prompt_cr



# --------------------------------------------------------------------------- #
#			System Varialbes				      #
# --------------------------------------------------------------------------- #

ZSH_VCS_PROMPT_ENABLE_CACHING='true'

# Primary prompt - different for root and eru (my administrative user)
if (( EUID == 0 )) || [[ `whoami` == eru ]]; then 
	PS1="${RED}%n${NO_COLOR}@%m %0d # "
else
	# Normal user
	setopt prompt_subst
	#PS1='${BLUE}%n${NO_COLOR}@%m %0~ $(vcs_super_info) $(prompt_char) '
	PS1='${BLUE}%n${NC}${MAGENTA}@${NC}${CYAN}%m${NC}${GREEN} %0~${NC} $(vcs_super_info) ${MAGENTA}$(prompt_char) ${NC}'
fi

# Secondary prompt - printed when the shell needs more information to complete
# a command (e.g. when linebreaking a string, or loop, etc.)
PS2="${GREEN}"'%_'"
"'`->'"${NO_COLOR} "

# Tertiary prompt - used within select loop
PS3="Choice: "

# Quaternary prompt - execution trace prompt (setopt xtrace)
PS4='+%N:%i:%_> '



# --------------------------------------------------------------------------- #
#			Auxilliary functions				      #
# --------------------------------------------------------------------------- #

# Use precmd hook is executed every time before the prompt is printed
precmd() {
    vcs_info
}

# Determine which prompt symbol to use (according to what kind of directory one
# is in)
prompt_char() {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    hg root >/dev/null 2>/dev/null && echo '☿' && return
    svn info >/dev/null 2>/dev/null && echo '○' && return
    echo '$'
}


