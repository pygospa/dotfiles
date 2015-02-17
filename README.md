# Welcome to my dotfiles

## Moved from Bitbucket

I've finally decided to move most of my coding stuff to GitHub. As a
consequence, here are my dotfiles, that where originally hosted at
[Bitbucket](https://bitbucket.org/pygospa/dotfiles) 

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

## How to use my vim setup

If you decided to use my vim setup, I use `pathogen` to organize my plugins. This
includes being able to install new plugins as git submodules. You don't have to
keep up with that, you can simply clone your desired additional plugins as
normal repositories into ~/.vim/bundle/ but then you'll loose the ability to
keep your directory under version control. 

After doing the three steps described at "How to install everything" you'll
need to issue the following commands:

	git submodule init
	git submodule update

This will initialize the submodules which up to then where just links to the
repositories. git will get all the plugin from all the repositories and there
you go: You have the current version of all plugins.

If you want to change a plugins version, just go to the plugin and checkout the
desired version, as you would normally do in git:

	cd dot/vim/bundle/plugin-name
	git checkout v2.0

If you want to update a single submodule repository (i.e. a certain plugin),
do:
	cd dot/vim/bundle/plugin-name
	git pull origin master

If you want to add a plugin, just clone it as submodule:

	cd dot
	git submodule add http://github.com/tpope/vim-fugitive.git vim/bundle/fugitive
	git commit -am "Add fugitive plugin to vim"

If you want to remove a plugin, you'll issue the following commands:

	cd dot
	git submodule deinit fugitive
	git rm fugitive

And last, but not least - to update all plugins in a single command, just issue
the following:

	cd dot
	git submodule foreach git pull origin master

### A small note on vundle and NeoBundle, etc.

In the past, more and more people switched from `pathogen` to `vundle` or
`NeoBundle`. In the past, the main reason for doing so was, that git did not
offer a way to remove submodules. Since version 1.8.3 (April 2013) git does.
vundle introduces an elegant way to easily update all plugins, but there's no
way to update individual plugins, and whenever you add or remove a plugin, all
plugins need to be updated. Also vundle does not know how to handle Mercurial
or SVN repositories of plugins, and you cannot just add content (e.g. from a
zip file) to the `bundle`-Directory, which makes it non-usable to me, as I
still often encounter plugins that I like to try out that are not yet available
in git. NeoBundle offers **experimental** support for other VCS, but also
cannot handle manual files. Other than that, the main difference to vundle is
it's integration in `unite` plugin by the same developer.

So to me, there's no real value in switching from pathogen. If you, like so
many more, like to switch anyhow, there is an easy way of doing so. First
install vundle or NeoBundle (which is fully vundle compatible). vundle and
NeoBundle expect a list of the plugins you want to install in the following
way:

	Plugin 'gituser/repository'

As I use submodules, the full URLs are in the .gitmodule file, so with a bit of
help from grep and sed we can produce a list and append it to the vimrc file:

	cd dot
	echo "filetype off\nset rtp+=~/.vim/bundle/Vundle.vim\ncall vundle#begin()" >> vimrc
	grep url .gitmodules | sed -e s/.*:// -e s/^/Plugin\ \'/ -e s/.git$/\'/ >> vimrc
	echo "call vundle#end()\nfiletype plugin indent on" >> vimrc
	git submodule deinit .
	git rm vim/bundle/*
	git commit -am "Remove submoduesl for vundle"

This will set up all the required changes in the vimrc (lines 2-4) and then
remove all submodules (line 5-6). After that (line 7) we commit the changes.

Now install the plugins according to the instructions at vundle/NeoBundle and
you're good to go.

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

