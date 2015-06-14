# Welcome to my dotfiles

## BE CAREFUL NOT TO OVERWRITE YOUR FILES!

Before running the install script, check whats included in the root directory
of the repository. Any files that you already have will be overwritten, so
check if you didn't change any of your configs to make sure not to loose
anything.

Only the `README.md`, `install.sh` and the `ousted` subdirectory are ignored.
If you just want single files, link them by hand. If you want to use most of my
files, just open your favorite editor and edit the `install.sh` script to
exclude anything you don't want. 

To do so, locate the line 

	EXCL=(install.sh ousted readme.md)

and add any files you want to left out, for instance, if you have your own
tmux.conf you want to keep, the file line should look like this:

	EXCL=(install.sh ousted readme.md tmux.conf)

## Best Practice

The best thing to do, if you want to build upon my dotfiles and like to keep
your files in a repository of your own, is to fork my project. This will not
only allow you to track your changes but also - if you inserted some
improvements and like me to profit from them - to send me a pull request.

If you do so, in the next step (How to install everything) just enter your own
repository link instead of mine, when cloning the repository to your local
machine.

## How to install everything

Just do:

	git clone https://github.com/pygospa/dotfiles.git ~/dot
	cd ~/dot
	./install.sh

The Install script will link all files you find in the repository to your home
directory, prefixing it with a '.', so for instance after executing the script
you'll find this in your home directory when executing `ls -ahl`

	.gitconfig@ -> /Users/pygospa/dot/gitconfig
	.hgrc@ -> ~/dot/hgrc
	.pentadactylrc@ -> ~/dot/pentadactylrc
	.tmux.conf@ -> ~/dot/tmux.conf
	.vim@ -> ~/dot/vim
	.vimrc@ -> ~/dot/vimrc
	.zshrc@ -> ~/dot/zshrc

## How to use my fvwm setup

If you are further interested in what thoughts went into creating my fvwm2 setup
and how to use the window manager, you'll find a dedicated
[README.md](./fvwm/README.md) in the `fvwm` subdirectory of the repository.

## How to use my vim setup

If you decide to use my vim setup, I use `pathogen` to organize my plugins. 
These are addes as git submodules, so there are some steps to take until
everything runs. I know some of you might think that `pathogen` is depricated
and shouldn't be used in favor of more recent vim plugin bundlers. 

I will elaborate on this and why I believe `pathogen` is still the best choice
(at least for this setup), as well as showing you in greater detail how to get
this vim configuration up and running in the [README.md](./vim/README.md)
located in the `vim` subdirectory of this repository.

## Deprecated files

Currently this repository does not contain much, but I intend to get all my
dotfiles into it. It'll also contain a folder called `ousted` containing all my
dotfiles for programs I don't use anymore. You can of course just manually link
them to your home directory if you like (but they are not maintained anymore).

	ln -s ~/dot/ousted/screen ~/.screenrc


## Contact

If you have any questions or suggestions, just contact me. You'll find my mail
address at my github profile, which is probably the best way to reach me. I use
GPG, and prefer encrypted mails; you can find my public key on keyservers,
searching for 1024D/402CB18E.

## License

If not stated differently and if applicable by law and the licenses of the
software I've configured with these dotfiles, all my works in this repository
fall under Creative Commons Attribution-ShareAlike 4.0 International License.
This means that you can use and republish any file and modify them to your
desire. If you like my stuff, I'd be glad if you refer to my
[blog](http://pygospa.wordpress.com). For furter information on the license, 
see [CC BY-SA 4.0](http://creativecommons.org/licenses/by-sa/4.0/).

## Acknowledgment

Last but not least I would like to thank all those people who constantly share
their Dotfiles (and did so even before ti was cool to do so on GitHub). They
have been a great help in many occasions and a constant source of inspiration. I
cannot remember all the people whose dotfiles I've consulted over the last 1,5
decades - if you find your distinctive work in this repository and want to be
named, please feel free to contact me. I would especially like to point out:

  - [Christian 'strcat' Schneider](http://strcat.de/)
  - [Grml's ZSH Page](http://grml.org/zsh/)
  - [Michael Prokop](http://michael-prokop.at/)
  - [Steve Losh](http://stevelosh.com/)
  - [yonchu](http://yonchu.hatenablog.com/)

