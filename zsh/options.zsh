


### 
### Job Control
###
 
# Do not run all background jobs at a lower priority
setopt no_bgnice 

# Report status of background/suspended jobs before exiting; second try will
# exit shell (use especially with nohup!)
setopt check_jobs

# Don't send SIGHUP to background processes when shell exits.
setopt no_hup

# Jobs in long format (i.e. display PID as well when suspending process)
setopt long_list_jobs

# report the status of backgrounds jobs immediately
setopt notify

# Make job control more posix conform
setopt no_posix_jobs


# I hate beeping clis
setopt nobeep

# instead of 'cd dir' type just 'dir' (except for when it's a command)
setopt auto_cd




#### HISTORY ####



# Parallel zsh sessions will write to the same histroy file instead of
# replacing it 
setopt append_history

# All zsh sessions will import new commands from the single history file
setopt share_history

# Save timestamp and duration of each command in the history using format
# ': <beginning time>:<elapsed seconds>;<command>'
setopt extended_history

# 
