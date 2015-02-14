# File			~/.zsh/functions.zsh
#
# Purpose		Contains self-defined functions
#
# Author		Kannan Thambiah <pygospa@gmail.com>
# Lates Version		github.com/pygospa/dotfiles
#
# Thanks to Christian Schneider, Michael Prokop and the Grml developers
# for sharing their configurations wich has been a great basis to work on my
# own!


# Determine which prompt symbol to use (according to what kind of directory one
# is in)

prompt_char() {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    hg root >/dev/null 2>/dev/null && echo '☿' && return
    svn info >/dev/null 2>/dev/null && echo '○' && return
    echo '$'
}

# This functions will open the remote remote repository of the current local 
# directory in the browser if it is pointing to github or bitbucket.
#
# OS X has 'open' command for opening different files with the associated
# program directly from CLI.
# Linux does not have open but different other possiblities:
# - $BROWSER (if that variable is set)
# - /path/to/browser
# - xdg-open (if that is installed)

bitb() {
	bbpath="$(hg paths 2>/dev/null | grep 'bitbucket.org' | head -1)"
	bburl="$(echo $bbpath | sed -e's|.*\(bitbucket.org.*\)|http://\1|')"

	if [[ `uname -s` == Darwin ]]; then
		[[ -n $bburl ]] && open $bburl || echo "No BitBucket path found!"
	elif [[ `uname -s` == Linux ]]; then
		[[ -n $bburl ]] && $BROWSER $bburl || echo "No BitBucket path found!"
	fi
}

gith() {
	ghpath="$(git config --get remote.origin.url)"

	if [ -z $ghpath ]; then
		echo "No GitHub path found!"
		exit 1;
	fi

	ghpath="${ghpath/git\@github\.com\:/https://github.com/}"
	ghurl="${ghpath/\.git//tree/}"
	branch="$(git symbolic-ref HEAD 2>/dev/null)" || branch="(unnamed branch)"
	branch=${branch##refs/heads/}
	ghurl=$ghurl$branch

	if [[ `uname -s` == Darwin ]]; then
		open $ghurl
	elif [[ `uname -s` == Linux ]]; then
		[[ -n $bburl ]] && $BROWSER $bburl || echo "No BitBucket path found!"
	fi
}


