### 
### Changing directories
###

# If input no command but directory, auto-cd to that directory
setopt auto_cd

# cd pushes old directory to stack
setopt auto_pushd

# cd arg is not a directory but a variable name, expand it.
setopt cdable_vars

# setting this, for link /foo/bar pointing to /baz/qux, cd /foo/bar/.. will
# set working directory to /baz. Unset it will set it to /foo
# HOWEVER, cd /foo/bar will set working directory to /foo/bar
setopt nochase_dots

# As chase_dots, but setting this will lead cd /foo/bar to working directory
# /baz/qux
setopt nochase_links

# Remove the restrictions by POSIX on cd
setopt noposix_cd

# Don't push multiple copies of same directory onto dir stack
setopt pushd_ignore_dups

# Exchange meanings of '+' and '-' when given  with number to specify directory
set nopushed_minus

# Do not print directory stack after pushd or popd
set pushd_silent

# Have pushd with no arguments act like 'pushd $HOME'
set nopushd_to_home
