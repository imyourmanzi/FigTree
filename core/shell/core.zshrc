# File: core.zshrc
# Author: Matt Manzi
# Date: 2019-10-30
#
# Base configuration for all devices with a zsh shell.


#### FigTree ####
alias fig='cd $FIG_HOME'


#### Oh My Zsh ####
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# zsh theme basics
ZSH_THEME_RANDOM_CANDIDATES=( "miloshadzic" "mortalscumbag" "muse" "smt" "af-magic" )

# history timestamps
HIST_STAMPS="%m/%d/%y %T "

# hyphen-insensitive completion, case sensitive completion must be off
# _ and - will be interchangeable
HYPHEN_INSENSITIVE="true"

# disable marking untracked files under VCS as dirty
# makes repository status check for large repositories much, much faster
DISABLE_UNTRACKED_FILES_DIRTY="true"

# load a few of your favorite plugins
plugins=(git)

# preferred editors for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='vim'
fi


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
    local levels=$1
    # 1 level by default
    if [[ -z $levels ]]; then
        levels=1
    fi
    for n ({1..$levels}) cd ..
}
alias up='_up'


#### meme ####
alias kk='cat $FIG_HOME/yes.txt'
alias imdone='cat $FIG_HOME/donedog.txt'
