# File: ls.bashrc
# Author: Matt Manzi
# Date: 2020-12-23
#
# Handy ls aliases that most of us expect to have by default.

# only set ls aliases if eza isn't available
if ! type eza &> /dev/null; then
    # See this: https://the.exa.website/docs/colour-themes
    export LS_COLORS="di=1;38;5;75:${LS_COLORS}"

    alias ll='ls -Fhl --color'
    alias la='ls -aFhl --color'
    # some systems don't allow single-letter aliases
    alias l='ls -CF --color' || alias lk='ls -CF --color'

    # realias since macOS doesn't like --color (use -G instead)
    if [[ "$FIG_OS" == "$__FIG_MAC_OS" ]]; then
        alias ll='ls -FhlG'
        alias la='ls -aFhlG'
        alias l='ls -CFG'
    fi
fi
