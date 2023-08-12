# File: exa.bashrc
# Author: Matt Manzi
# Date: 2022-04-19
#
# Aliases for https://github.com/ogham/exa

if type exa &> /dev/null; then
    # See this: https://the.exa.website/docs/colour-themes
    export LS_COLORS="${LS_COLORS}:di=1;38;5;27"
    export EXA_COLORS="${EXA_COLORS}:da=38;5;33"

    __exaIncludeGit="$({ exa --version | grep -q -- '+git'; } && echo -n "--git")"

    alias le="exa -lbF --color=auto --group-directories-first --no-user --time=modified --time-style=iso $__exaIncludeGit"
    alias lx="exa -albghF --color=auto --group-directories-first --time=modified --time-style=iso $__exaIncludeGit"
fi
