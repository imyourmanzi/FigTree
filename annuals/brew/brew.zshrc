# File: brew.zshrc
# Author: Matt Manzi
# Date: 2022-01-05
#
# More information here:
# https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh

if type brew &>/dev/null; then
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

    # if Oh My Zsh is installed, we don't need to compinit
    if ls $HOME/.oh-my-zsh &> /dev/null; then
    else
        autoload -Uz compinit
        compinit
    fi
fi
