# File: brew.bashrc
# Author: Matt Manzi
# Date: 2022-01-05
#
# More information here:
# https://docs.brew.sh/Shell-Completion#configuring-completions-in-bash

[ -x "/opt/homebrew/bin/brew" ] && eval "$(/opt/homebrew/bin/brew shellenv)"
[ -x "/usr/local/bin/brew" ] && eval "$(/usr/local/bin/brew shellenv)"
[ -x "/home/linuxbrew/.linuxbrew/bin/brew" ] && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

if type brew &>/dev/null; then
    HOMEBREW_PREFIX="$(brew --prefix)"

    if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
        source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
    else
        for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*; do
            [[ -r "${COMPLETION}" ]] && source "${COMPLETION}"
        done
    fi
fi
