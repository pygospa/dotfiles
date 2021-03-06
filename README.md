# Welcome to my dotfiles

By cloning this repository you get all my configuration files from different
UNIX machines and are free to use them or to modify them to your needs.

In this README I suppose that you cloned this repository into a directory named
  
	~/dot

even though this repository is named `dotfiles` to be easily found by others.

## Your dotfiles are save

I have added two scripts for easy installing and uninstalling while keeping your
files save. Now, none of your dotfiles in home are overridden - they are all
backuped by moving them into ~/dot/backup

Only after all your files are moved to that backup path, are the new files
linked to your home directory. This way, no file of yours gets lost and you can
easily revert the changes. To further simplify this, an uninstall script is also
included. This will remove all links to the ~/dot directory and move all your
dotfiles back to your home directory.

So now everything is saved.

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

Before running the install script, check whats included in the root directory
of the repository. Any files that you might want to keep, can be excluded (see
below).

Only the `README.md`, `install.sh`, `LICENSE`, `ousted` and `uninstall.sh` are
ignored by default (plus additional software on macOS that is not needed).
If you just want single configs, link them by hand. If you want to use most of my
files, just open your favorite editor and edit the `install.sh` script to
exclude anything you don't want.

To do so, locate the line

	EXCL=(backup install.sh ousted README.md)

and add any files you want to left out, for instance, if you have your own
tmux.conf you want to keep, the file line should look like this:

	EXCL=(backup install.sh ousted README.md tmux.conf)

Once you are finished configuring the install script, run it via:

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

This list is not complete but only shows some examples.
All dotfiles that already existed can be found by navigating to:

	dot/backup

You can test my configs, by installing everything, and easiyl replace every
config with the one you had, by moving it back from the `dot/backup` directory,
e.g.

	mv dot/backup/.vimrc ~/.vimrc

Be aware, to move and not copy it out of `dot/backup`, otherwise it will be
overridden again, once you use the `uninstall.sh` script. If during the
installation time and the uninstalling you made any changes to e.g. `.vimrc`
that `.vimrc` at your home directory will be overridden by the one in backup.

## How to deinstall everything

Using the uninstall script I provided, it is easy to clean up everything again.
Simply run

	cd ~/dot
	./uninstall.sh

Only dotfiles that exist at your home directory and that link to a path
containing the name of my dotfile direcotry in their path will be removed.

So any file you replaced after installation is save. The deinstall will also put
back all the dotfiles that where in your directory before you installed my
dotfiles, thus you can simply get back to the state you where in, before
installing my dotfiles.

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
address at my github profile, which is probably the best way to reach me.

## License

Configuration files are a gray area when it comes to copyright and licensing.
All configs are handwritten by me, and partly inspired by others but mainly 
compiled by heavily relying on man files and documentation provided by the
distributor of the used softare.

As for the script files that are written by me you will find a coypright notice
in the files. You are allowed to use them as stated in the MIT License file that
you will find in this repository.

## Acknowledgment

Last but not least I would like to thank all those people who constantly share
their Dotfiles (and did so even before ti was cool to do so on GitHub). They
have been a great help in many occasions and a constant source of inspiration. I
cannot remember all the people whose dotfiles I've consulted over the last 15
years - if you find your distinctive work in this repository and want to be
named, please feel free to contact me. I would especially like to point out:

  - [Christian 'strcat' Schneider](http://strcat.de/)
  - [Grml's ZSH Page](http://grml.org/zsh/)
  - [Michael Prokop](http://michael-prokop.at/)
  - [Steve Losh](http://stevelosh.com/)
  - [yonchu](http://yonchu.hatenablog.com/)

