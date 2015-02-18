
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

