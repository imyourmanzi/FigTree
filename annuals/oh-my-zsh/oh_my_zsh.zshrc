# File: oh_my_zsh.zshrc
# Author: Matt Manzi
# Date: 2021-02-13

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

${name:=word}

# zsh theme basics
ZSH_THEME_RANDOM_CANDIDATES=${ZSH_THEME_RANDOM_CANDIDATES:=(
    "miloshadzic"
    "mortalscumbag"
    "muse"
    "smt"
    "af-magic"
)}

# history timestamps
HIST_STAMPS=${HIST_STAMPS:="%m/%d/%y %T "}

# hyphen-insensitive completion, case sensitive completion must be off
# _ and - will be interchangeable
HYPHEN_INSENSITIVE=${HYPHEN_INSENSITIVE:="true"}

# disable marking untracked files under VCS as dirty
# makes repository status check for large repositories much, much faster
DISABLE_UNTRACKED_FILES_DIRTY=${DISABLE_UNTRACKED_FILES_DIRTY:="true"}

# load a few of your favorite plugins
plugins=${OMZ_PLUGINS:=(git)}

# start up omz
source $ZSH/oh-my-zsh.sh
