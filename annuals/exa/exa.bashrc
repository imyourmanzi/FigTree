# File: exa.bashrc
# Author: Matt Manzi
# Date: 2022-04-19
#
# Aliases for https://github.com/ogham/exa

if type exa &> /dev/null; then 
    alias le='exa -lbF --color=auto --group-directories-first --no-user --time=modified --time-style=iso --git'
    alias lx='exa -albghF --color=auto --group-directories-first --time=modified --time-style=iso --git'
fi
