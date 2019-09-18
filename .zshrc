### History Settings
# How many lines of history to keep in memory
HISTSIZE=5000
# Where to save history to disk
HISTFILE=${ZDOTDIR}/.zsh_history
# Number of history entries to save
SAVEHIST=5000

setopt EXTENDED_HISTORY
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY
