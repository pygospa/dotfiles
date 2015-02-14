zstyle ':vcs_info:*' enable hg git svn
zstyle ':vcs_info:(hg*|git*):*' get-revision true
zstyle ':vcs_info:(hg*|git*):*' check-for-changes true

zstyle ':vcs_info:(hg*|git*)' formats "(%s) %7.7i %c%u %b%m " # hash changes branch misc
zstyle ':vcs_info:(hg*|git*)' actionformats "(%s|${white}%a${gray}) %7.7i %c%u %b%m "
zstyle ':vcs_info:hg*:*' branchformat "%b" # only show branch

zstyle ':vcs_info:(hg*|git*):*' stagedstr "${green}S${gray}"
zstyle ':vcs_info:(hg*|git*):*' unstagedstr "${red}U${gray}"

zstyle ':vcs_info:git*+set-message:*' hooks git-st git-stash git-untracked


#if [[ "$TERM" == dumb ]] ; then
#    zstyle ':vcs_info:*' actionformats "(%s%)-[%b|%a] " "zsh: %r"
#    zstyle ':vcs_info:*' formats       "(%s%)-[%b] "    "zsh: %r"
#else
#    # these are the same, just with a lot of colors:
#    zstyle ':vcs_info:*' actionformats "${MAGENTA}(${NO_COLOR}%s${MAGENTA})${YELLOW}-${MAGENTA}[${GREEN}%b${YELLOW}|${RED}%a${MAGENTA}]${NO_COLOR} " \
	#                                       "zsh: %r"
#    zstyle ':vcs_info:*' formats       "${MAGENTA}(${NO_COLOR}%s${MAGENTA})${NO_COLOR}-${RED}%7.7i${NO_COLOR} %c%u: %b ${MAGENTA}[${GREEN}%b${MAGENTA}]${NO_COLOR}%} %c%u %m" \
	#                                       "zsh: %r"
#    zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat "%b${RED}:${YELLOW}%r"
#fi

###########

#zstyle ':vcs_info:git*' formats "(%s) %7.7i %c%u %b%m"
#zstyle ':vcs_info:git*' actionformats "(%s|%a) %7.7i %c%u %b%m"
#
#zstyle ':vcs_info:git*+set-message:*' hooks git-st git-stash


# Show remote ref name and number of commits ahead-of or behind



# Show remote ref name and number of commits ahead-of or behind
function +vi-git-st() {
local ahead behind remote
local -a gitstatus
# Are we on a remote-tracking branch?
remote=${$(git rev-parse --verify ${hook_com[branch]}@{upstream} \
	--symbolic-full-name --abbrev-ref 2>/dev/null)}
if [[ -n ${remote} ]] ; then
	ahead=$(git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l)
	(( $ahead )) && gitstatus+=( "${green}+${ahead}${gray}" )
	behind=$(git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l)
	(( $behind )) && gitstatus+=( "${red}-${behind}${gray}" )
	user_data[gitstatus]=${gitstatus}
	hook_com[branch]="${hook_com[branch]} [${remote} ${(j:/:)gitstatus}]"
fi
}
# Show the above/behind upstream counts more tersely for the compact display
function +vi-git-st-compact() {
[[ -n ${user_data[gitstatus]} ]] \
	&& hook_com[misc]="@{u}${(j:/:)user_data[gitstatus]}"
}
# Show count of stashed changes
function +vi-git-stash() {
local -a stashes
if [[ -s $(git rev-parse --git-dir)/refs/stash ]] ; then
	stashes=$(git stash list 2>/dev/null | wc -l)
	hook_com[misc]+=" (${stashes} stashed)"
fi
}
# Indicate if there are any untracked files present
function +vi-git-untracked() {
local untracked
#check if there's at least 1 untracked file
untracked=${$(git ls-files --exclude-standard --others | head -n 1)}
if [[ -n ${untracked} ]] ; then
	hook_com[unstaged]="${hook_com[unstaged]}${yellow}?${gray}"
fi
}



#
#function +vi-git-st() {
#    local ahead behind remote
#    local -a gitstatus
#
#    # Are we on a remote-tracking branch?
#    remote=${$(git rev-parse --verify ${hook_com[branch]}@{upstream} \
	#        --symbolic-full-name 2>/dev/null)/refs\/remotes\/}
#
#    if [[ -n ${remote} ]] ; then
#        ahead=$(git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l)
#        (( $ahead )) && gitstatus+=( "${c3}+${ahead}${c2}" )
#
#        behind=$(git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l)
#        (( $behind )) && gitstatus+=( "${c4}-${behind}${c2}" )
#
#        hook_com[branch]="${hook_com[branch]} [${remote} ${(j:/:)gitstatus}]"
#    fi
#}
#
## Show count of stashed changes
#function +vi-git-stash() {
#    local -a stashes
#
#    if [[ -s $(git rev-parse --git-dir)/refs/stash ]] ; then
#   # if [[ -s ${hook_com[base]}/.git/refs/stash ]] ; then
#        stashes=$(git stash list 2>/dev/null | wc -l)
#        hook_com[misc]+=" (${stashes} stashed)"
#    fi
#}
