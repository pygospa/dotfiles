precmd() {
	vcs_info
}

# Primary prompt - different for root and eru (my administrative user)
if (( EUID == 0 )) || [[ `whoami` == eru ]]; then 
	PS1="${RED}%n${NO_COLOR}@%m %0d # "
else
	# Normal user
	setopt prompt_subst
	PS1='${BLUE}%n${NO_COLOR}@%m %0~ $(vcs_super_info) $(prompt_char) '
fi

# Secondary prompt - printed when the shell needs more information to complete
# a command (e.g. when linebreaking a string, or loop, etc.)
PS2="${GREEN}"'%_'"
"'`->'"${NO_COLOR} "

# Tertiary prompt - used within select loop
PS3="Choice: "

# Quaternary prompt - execution trace prompt (setopt xtrace)
PS4='+%N:%i:%_> '
