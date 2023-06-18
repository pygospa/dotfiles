# Purpose		Setup keyboard
#			zsh does not read /etc/inputrc which normally tells the
#			shell what commands are sent by the terminal emulator
#			Therefore, these keys need to be bound manually.
#
# Author		Kannan Thambiah <pygospa@gmail.com>
# Lates Version		https://github.com/pygospa/dotfiles


# If we can use terminfo, use terminfo for setting up keys
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
	function zle-line-init () {
		echoti smkx
	}
	function zle-line-finish () {
		echoti rmkx
	}

	zle -N zle-line-init
	zle -N zle-line-finish

	typeset -A key

	# set up key variables
	key[Home]=${terminfo[khome]}
	key[End]=${terminfo[kend]}
	key[Insert]=${terminfo[kich1]}
	key[Delete]=${terminfo[kdch1]}
	key[Up]=${terminfo[kcuu1]}
	key[Down]=${terminfo[kcud1]}
#	key[CtrlLeft]=${terminfo[kcub1]}
	key[Left]=${terminfo[kcub1]}
#	key[CtrlRight]=${terminfo[kpp]}
	key[Right]=${terminfo[kcuf1]}
    key[PageUp]=${terminfo[kpp]}
    key[PageDown]=${terminfo[knp]}

# If we cannot use terminfo fall back to zkbd querying the user to insert a
# number of keys and saving them to a term-vendor-ostype file under .zkbd
else
	autoload -Uz zkbd

	function zkbd_file() {
		[[ -f ~/.zkbd/${TERM}-${VENDOR}-${OSTYPE} ]] && printf '%s' ~/".zkbd/${TERM}-${VENDOR}-${OSTYPE}" && return 0
		[[ -f ~/.zkbd/${TERM}-${DISPLAY}          ]] && printf '%s' ~/".zkbd/${TERM}-${DISPLAY}"          && return 0
		return 1
	}

	[[ ! -d ~/.zkbd ]] && mkdir ~/.zkbd
	keyfile=$(zkbd_file)
	ret=$?
	if [[ ${ret} -ne 0 ]]; then
		zkbd
		keyfile=$(zkbd_file)
		ret=$?
	fi
	if [[ ${ret} -eq 0 ]] ; then
		#    printf 'sourcing keyfile'
		source "${keyfile}"
	else
		printf 'Failed to setup keys using zkbd.\n'
	fi
	unfunction zkbd_file; unset keyfile ret

fi

# Once, key variables are populated by either terminfo or zkbd, bind them:
[[ -n "${key[Home]}" ]]		&& bindkey  "${key[Home]}"	beginning-of-line
[[ -n "${key[End]}" ]]		&& bindkey  "${key[End]}"	end-of-line
[[ -n "${key[Insert]}" ]]	&& bindkey  "${key[Insert]}"	overwrite-mode
[[ -n "${key[Delete]}" ]]	&& bindkey  "${key[Delete]}"	delete-char
[[ -n "${key[Up]}" ]]		&& bindkey  "${key[Up]}"	up-line-or-history
[[ -n "${key[Down]}" ]]		&& bindkey  "${key[Down]}"	down-line-or-history
[[ -n "${key[CtrlLeft]}" ]]	&& bindkey  "${key[CtrlLeft]}"	backward-word
[[ -n "${key[Left]}" ]]		&& bindkey  "${key[Left]}"	backward-char
[[ -n "${key[CtrlRight]}" ]]	&& bindkey  "${key[CtrlRight]}"	forward-word
[[ -n "${key[Right]}" ]]	&& bindkey  "${key[Right]}"	forward-char

