# Purpose		This file contains system specific settings for macOS
#
# Author		Kannan Thambiah <pygospa@gmail.com>
# Latest Version	https://github.com/pygospa/dotfiles


#------------------------------------------------------------------------------
# Aliases
#

# Toggle Finder to show hidden files
alias show_hidden=' defaults write com.apple.finder AppleShowAllFiles -boolean true ; killall Finder'
alias hide_hidden=' defaults write com.apple.finder AppleShowAllFiles -boolean false ; killall Finder'

# Shorthand for compiling C++11 on macOS using xcodes clang
alias cppcompile='c++ -std=c++11 -stdlib=libc++'

# Set easy to use commands for starting and stoping postgresql if available
if [[ -x `which pg_ctl` ]]; then
	alias pg-start=' pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
	alias pg-stop=' pg_ctl -D /usr/local/var/postgres stop -s -m fast'
fi



#------------------------------------------------------------------------------
# System variables
#

# Mac keeps path information in /etc/paths.d to automatically create path
# entries for new installed software. As we rewrite the path, we add them
# manually
for file in /etc/paths.d/*; do
	new="$(<$file)"
	export PATH="$PATH:$new"
done

# Use Firefox as default browser on OS X, if available
if [[ -x /Applications/Firefox.app/Contents/MacOS/firefox ]]; then
	export BROWSER="/Applications/Firefox.app/Contents/MacOS/firefox"
fi

# Java home
export JAVA_HOME="`/usr/libexec/java_home -v 1.8`"

