# File: eza.zshrc
# Author: Matt Manzi
# Date: 2022-04-19
#
# Aliases for https://github.com/eza-community/eza

if type eza &> /dev/null; then
    # See this: https://the.exa.website/docs/colour-themes
    export LS_COLORS="${LS_COLORS}:di=1;38;5;27"
    export EXA_COLORS="${EXA_COLORS}:da=38;5;33"

    __ezaIncludeGit="$({ eza --version | grep -q -- '+git' } && echo -n "--git")"

    alias ls="eza -F --color=auto --group-directories-first"
    alias ll="eza -lbF --color=auto --group-directories-first --no-user --time=modified --time-style=iso $__ezaIncludeGit"
    alias la="eza -albghF --color=auto --group-directories-first --time=modified --time-style=iso $__ezaIncludeGit"
fi
