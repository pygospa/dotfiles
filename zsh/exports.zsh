# File			~/.zsh/exports.zsh
# Purpose		Subdirectory file containing system variable exports
# Author		Kannan Thambiah <pygospa@gmail.com>
# Latest Version	github.com/pygospa/dotfiles

# PATH 
# ~/bin -> /usr/local/bin -> /usr/bin -> /bin -> /usr/sbin -> /sbin -> /
export PATH="$HOME/bin:/usr/local/bin:/usr/local/rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# Mac keeps path information in /etc/paths.d to automatically create path
# entries for new installed software. As we rewrite the path, we add them
# manually
for file in /etc/paths.d/*; do
	new="$(<$file)"
	export PATH="$PATH:$new"
done
