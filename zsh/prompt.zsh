if (( EUID == 0 )) || [[ `whoami` == eru ]]; then 
	PS1="${RED}%n${NO_COLOR}@%m %0d %# "
else
	PS1="${BLUE}%n${NO_COLOR}@%m %0~ %{$NO_COLOR%}%# "
fi


