case $TERM in
	rxvt*)
		precmd(){
			# Restore urxvt-title to 'zsh'
			print -Pn "\e]2;zsh:%~\a"
		}
		preexec(){
			# set urxvt-title to running program
			print -Pn "\e]2;zsh:$(echo "$1" | cut -d" " -f1)\a"
                }
                ;;

	screen*)
		precmd(){
			# Restore tmux-title to 'zsh'
			printf "\033kzsh\033\\"
			# Restore urxvt-title to 'zsh'
			print -Pn "\e]2;zsh:%~\a"
		}
		preexec(){
			# set tmux-title to running program
			printf "\033k$(echo "$1" | cut -d" " -f1)\033\\"
			# set urxvt-title to running program
			print -Pn "\e]2;zsh:$(echo "$1" | cut -d" " -f1)\a"
                }
                ;;
esac
