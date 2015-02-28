# File			~/.zsh/autoload.zsh
#
# Purpose		autoload zsh 
#			Here all subsystems of ZSH are loaded and initialized
#
# Author		Kannan Thambiah <pygospa@gmail.com>
# Lates Version		github.com/pygospa/dotfiles



autoload -Uz vcs_info; vcs_info;

autoload -U zmv
autoload -U zed


# Load a few more functions and tie them to widgets, so they can be bound:
autoload -U insert-file && zle -N insert-file
autoload -U edit-command-line && zle -N edit-command-line
autoload -U insert-unicode-char && zle -N insert-unicode-char


