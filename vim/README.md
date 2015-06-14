# VIM 

## Some vim vs emacs rant? ;)

When I was getting started with using Linux, I spent a long time reading
articles people that I admired (Hackers) posted online. One of them said to
learn to use a *proper* editor, elaborating that there actually are only two
*proper* editors (proper in the sense that they are programmable):

  - [vi](https://en.wikipedia.org/wiki/Vi)
  - [emacs](https://en.wikipedia.org/wiki/Emacs)

So I evaluated pros and cons, and devided to go with vi, as it is lightweight
and installed as standard editor on any Unix, while emachs, despite it's
enormous plugin capabilities was still pretty packed as editor, therefore large
and not preinstalled.

That is the only reason why I learned to use [vim](https://en.wikipedia.org/wiki/Vim_(text_editor))
instead of emacs. Over the time I became so fluent that nowadays, when on an emacs, 
everthing takes hours, and half the time I try to figure out how to revert something 
in emacs because of my fingers being faster than my mind in typing in vim commands 
that do totally different things in emacs.

If you are an emacs guy, good for you. If you haven't decided yet, I'll
encourage you to try out vim for a lightweight, yet enormously powerful editor
that really can be found on every UNIX machine (at least every machine I sat
on). Never the less, keep in mind, that it doesn't matter which tool you use as
long as you master it. Try to stick to one editor and get as efficient with it
as possible. Both, vim *and* emacs allow you to do *great* things while editing
text - you just need to embrace the power.


## How to install the vim configuration

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


