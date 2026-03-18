# File: history.bashrc
# Author: Matt Manzi
# Date: 2020-12-23
#
# Set history to ignore duplicates and show time with commands.  Also enable a good-to-use
# history search & recall with fzf.

export HISTCONTROL=ignoredups
export HISTTIMEFORMAT="%m/%d/%y %T "

if type -t fzf > /dev/null; then
    eval "$(fzf --bash)"
fi
