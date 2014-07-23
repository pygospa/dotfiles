# Welcome to my dotfiles

## Moved from Bitbucket

I've finally decided to move most of my coding stuff from Bitbucket to github. As a consequence, here are my dotfiles, that where originally hostet at https://bitbucket.org/pygospa/dotfiles

## How to install

Just do:

    git clone https://github.com/pygospa/dotfiles.git ~/dot
    cd ~/dot
    ./install.sh

The Install script will link all files you find in the repository to your home directory, prefixing it with a '.', so for instance after executing the script you'll find this in your home directory when executing `ls -ahl`

    .vimrc@ -> ~/dot/vimrc
    .hgrc@ -> ~/dot/hgrc
    .pentadactylrc@ -> ~/dot/pentadactylrc
    .tmux.conf@ -> ~/dot/tmux.conf
    .vimrc@ -> ~/dot/vimrc
    .zshrc@ -> ~/dot/zshrc

Currently this repository does not contain mutch, but I intend to get all my dotfiles into it. It'll also contain a folder called `ousted` containing all my dotfiles for programs I don't use anymore. You can of course just manually link them to your home directory if you like (but they are not maintained anymore).

    ln -s ~/dot/ousted/screen ~/.screenrc

## BE CAREFUL NOT TO OVERWRITE YOUR FILES!

Before running the install skript, check whats included in the root directory of the repository. Any files that you already have will be overwritten, so check if you didn't change any of your confingsto make sure not to loose anything.

Only the `README.md`, `install.sh` and the `ousted` subdirectory are ignored. If you just want single files, link them by hand. If you want to use most of my files, just open your favorit editor and edit the `install.sh` script to exclude anything you don't want. 

To do so, locate the line 

    EXCL=(install.sh ousted readme.md)

and add any files you want to left out, for instance, if you have your own tmux.conf you want to keep, the file line should look like this:

    EXCL=(install.sh ousted readme.md tmux.conf)


## Contact

If you have any questions or suggestions, just contact me. You'll find my mail address at my github profile, which is probably the best way to reach me. I use GPG, and prefer encrypted mails; you can find my public key on keyservers, serching for 1024D/402CB18E.

