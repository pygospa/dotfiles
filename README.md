# Welcome to my personal dotfiles

> **Etymology:** *dot* + *file*
>
> **Noun:** **dotfile** (*plural* **dotfiles**)
>
> (*computing, Unix*)
> A file or directory whose name begins with a dot (period or full stop),
> typically hidden from view and sometimes used to store configuration settings.

[Source](https://en.wiktionary.org/wiki/dotfile)

Technically,
this is not **just** a dotfiles repo,
but rather a configuration repo,
as I am keeping non-dotfile system-wide configurations
(that are usually found in `/etc`)
here as well.



## Setup
### Prererequisites

Minimal Unix system,
that has a network connection,
a user with [sudo](https://www.sudo.ws/) rights,
and [git](https://git-scm.com/),
[ssh](https://www.openssh.com/),
and [ansible](https://www.ansible.com/) installed.


#### Arch Linxu

On Arch this can be achieved by changing the command
in [Step 2.2](https://wiki.archlinux.org/title/installation_guide#Install_essential_packages)
as follows:

`pacstrap -K /mnt ansible base git linux linux-firmware openssh sudo`

After chrooting to the environment,
add a user:

`useradd -m -G wheel pygospa` and give him a password `passwd pygospa`.


#### Ubuntu Linux

The Ubuntu setup installs loads of software (you probably never need),
so here after installation everything is already setup.
The only packages that need manual installation:

`apt install ansible git`

### Preparations

Clone the repository and install needed ansible modules by running:

`ansible-galaxy collecton install -r requirements.yaml`

### Running the playbook

`ansible-playbook ansible-playbook.yaml -K`

This will install all my daily needed software;
including system software
(like X11 on Arch, user-driven package repositories, "unsnapping" Ubuntu, etc.)
and create links to where all the configurations need to go;
if there's already a file present,
this file will first be moved to the ./backup file in this repository,
so check it after running the playbook.

As the configuration files will stay in this repository,
they are kept under version control!
Any changes in the file (e.g. `/etc/X11/xorg.conf.d/00-keyboard.conf`)
should be committed to the repo to have
**(a)** a changelog for your configuration files and
**(b)** a backup of your important configuration files and
**(c)** an easy means of restoration if needed.



## Philosophy
### Config files

In my early linux days I tinkered alot with my configuration files,
and developed a certain style,
which can be subsumized as a philosopy:

1. Every file should be self-contained;
   needing the manual, the Internet, etc.
   to look thinks up is timeconsuming.
   This is why you'll find a lot of comments in my configuration files
2. Explciite is better than implicit;
   this is especially true for default values.
   While they keep configuration files neat and short,
   they also ask you to know things about the default settings
   and even worse: These settings might also change.
3. Modularity helps finding things faster;
   well documented and explicite configuration files tend to grow;
   organizing them in topics makes life easier,
   breaking them up into multiple


### Ansible


### Software I use


## History

Since my early Linux days with [SuSE 6.3](https://en.opensuse.org/Archive:SuSE_Linux_6.3)
I've been keeping a set of my most
important configuration files that I adjusted to my needs;
starting with a 3.5" floppy disc,
then upgrading to a USB thumbdrive,
until finally pushing them to github.
The oldest files in this repository date back nearly 20 years ago
(e.g. my [fvwm² files](https://github.com/pygospa/dotfiles/commit/9de0db60df5bb3aa3c03fadd7a8fe991661a4d52))
and went through a lot of devies,
different distributions
([SuSE](https://www.suse.com/),
[Debian](https://www.debian.org/),
[Gentoo](https://www.gentoo.org/),
[Ubuntu](https://ubuntu.com/),
[Arch Linux](https://archlinux.org/)
and even
[OS X / macOS](https://www.apple.com/macos)).

They've also went through a lot of different ways of handling;
from copy and paste,
turing the entire home directory to a repository,
a bare git with separated working directory approach,
a self-written script that links the files to a repsitory,
to the current variant:
An ansible managed repository
that not onyl automating the process of linking my dotfiles,
but also takes care of installing my software,
while being "operating system agnostic";
tried and tested on Arch Linux, Ubuntu and macOS.


## Suggestions, recommendations and constructive critizism

... will be well-received by me.
If you feel that I can improve my setup,
or that I am making crucial mistakes,
or if you feel that there is a certain software
or a certain configuration for a software
that I really need to check out,
then please get in contact with me,
via email or mastodon (see my GitHub profile),
or via GitHub Issue or pull request.
**THANKS!**


## Acknowledgements

Last but not least,
I would like to thank all those people who constantly share their dotfiles
(and did so even before it was cool to do so on GitHub).
They have been a great help in many occasions
and a constant source of inspiration.
I cannot remember all the people whose dotfiles
I've consulted over the last 15 years - 
if you find your distinctive work in this repository and want to be named,
please feel free to contact me.
I would especially like to point out:

  - [Christian 'strcat' Schneider](http://strcat.de/)
  - [Grml's ZSH Page](http://grml.org/zsh/)
  - [Michael Prokop](http://michael-prokop.at/)
  - [Steve Losh](http://stevelosh.com/)
  - [yonchu](http://yonchu.hatenablog.com/)

