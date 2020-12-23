# File: core.bashrc
# Author: Matt Manzi
# Date: 2019-01-03
#
# Base configuration for all devices with a bash shell.


#### FigTree ####
alias fig='cd $FIG_HOME'


#### builtins ####
# use this standard prompt
export OLD_PS1=$PS1
export PS1="\u@\H:\W\$ "

# set history to ignore duplicates and show time with commands
export HISTCONTROL=ignoredups
export HISTTIMEFORMAT="%m/%d/%y %T "

# set editor (source: https://stackoverflow.com/a/2596835)
export VISUAL=vim
export EDITOR="$VISUAL"


#### exit ####
alias x='exit'


#### ls ####
alias ll='ls -Fhl --color'
alias la='ls -aFhl --color'
alias l='ls -CF --color'
alias lk='ls -CF --color' # some systems don't allow single-letter aliases


#### pwd ####
alias pwd='pwd -P' # frick a logical path


#### ip ####
alias ip='ip -c' # colorful!


#### up ####
# move up directories for me
_up() {
    local levels=$1 count=1
    # 1 level by default
    if [[ -z $levels ]]; then
        levels=1
    fi
    while ((count++ <= levels)); do
        cd ..
    done
}
alias up='_up'


#### meme ####
alias kk='cat $FIG_HOME/yes.txt'
alias imdone='cat $FIG_HOME/donedog.txt'
