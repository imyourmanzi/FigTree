# File: exa.zshrc
# Author: Matt Manzi
# Date: 2022-04-19
#
# Aliases for https://github.com/ogham/exa

if type exa &> /dev/null; then
    # See this: https://the.exa.website/docs/colour-themes
    export LS_COLORS="${LS_COLORS}:di=1;38;5;27"
    export EXA_COLORS="${EXA_COLORS}:da=38;5;33"

    alias le='exa -lbF --color=auto --group-directories-first --no-user --time=modified --time-style=iso --git'
    alias lx='exa -albghF --color=auto --group-directories-first --time=modified --time-style=iso --git'
fi
