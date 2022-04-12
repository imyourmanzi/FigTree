# File: oh_my_zsh.zshrc
# Author: Matt Manzi
# Date: 2021-02-13
#
# The containing directory is prefixed with an `_` to ensure it runs first in setup.  Oh
# My Zsh sets a lot of aliases that we may want to override later (e.g. aliases for `ls`).

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# if Oh My Zsh is installed, then set it up
if ls $ZSH &> /dev/null; then
    # zsh theme basics
    declare -a ZSH_THEME_RANDOM_CANDIDATES=("miloshadzic" "mortalscumbag" "muse" "smt" "af-magic")
    if (( ${+OMZ_THEME_RANDOM_CANDIDATES} )); then
        ZSH_THEME_RANDOM_CANDIDATES=(${OMZ_THEME_RANDOM_CANDIDATES[@]})
    fi

    ZSH_THEME=${ZSH_THEME:="random"}

    # history timestamps
    HIST_STAMPS=${HIST_STAMPS:="%m/%d/%y %T "}

    # hyphen-insensitive completion, case sensitive completion must be off
    # _ and - will be interchangeable
    HYPHEN_INSENSITIVE=${HYPHEN_INSENSITIVE:="true"}

    # disable marking untracked files under VCS as dirty
    # makes repository status check for large repositories much, much faster
    DISABLE_UNTRACKED_FILES_DIRTY=${DISABLE_UNTRACKED_FILES_DIRTY:="true"}

    # load a few of your favorite plugins by setting OMZ_PLUGINS in your .zshrc
    __DEFAULT_PLUGINS_ENABLED=(git)
    if type fzf &> /dev/null; then
        __DEFAULT_PLUGINS_ENABLED+=(fzf)
    fi
    plugins=(${(A)OMZ_PLUGINS:=$__DEFAULT_PLUGINS_ENABLED})

    # start up omz
    source $ZSH/oh-my-zsh.sh
fi
