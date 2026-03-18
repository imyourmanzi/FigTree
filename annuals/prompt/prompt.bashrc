# File: prompt.bashrc
# Author: Matt Manzi
# Date: 2020-12-23
#
# Set the prompt to something standard (but fun) to make it consistent across platforms.
#
# Git prompt source is a file from the official git project:
# https://github.com/git/git/blob/ca1db8a0f7dc0dbea892e99f5b37c5fe5861be71/contrib/completion/git-prompt.sh
#
# NOTE: in functions for prompts, we need to use \001 and \002 instead of \[ and \], so
# I've opted to use them everywhere. Source:
# https://wiki.archlinux.org/title/Bash/Prompt_customization#Embedding_commands

__git_prompt_source="${FIG_HOME}/annuals/prompt/git-prompt.sh"

if ! type -t __git_ps1 > /dev/null; then
    source "${__git_prompt_source}"
fi

__fig_ps_blue="\001\e[34m\002"
__fig_ps_bold="\001\e[1m\002"
__fig_ps_cyan="\001\e[36m\002"
__fig_ps_gray="\001\e[90m\002"
__fig_ps_green="\001\e[32m\002"
__fig_ps_lavender="\001\e[38;5;134m\002"
__fig_ps_red="\001\e[31m\002"
__fig_ps_reset="\001\e[0m\002"
__fig_ps_yellow="\001\e[33m\002"

# Get a color-coded exit code from the prior command
__fig_ps_exit_code() {
    local exit_code="$?"

    if [[ "$exit_code" = "0" ]]; then
        echo -en "${__fig_ps_green}"
    else
        echo -en "${__fig_ps_red}"
    fi
    echo -en "${exit_code}${__fig_ps_reset}"
}

# Get an indicator for when the shell is running in WSL (useful because the hostname might
# be the same as the Windows host)
# This can be used as a suffix to the hostname variable like:
# `...\H\$(__fig_ps_wsl_indicator)...`
__fig_ps_wsl_indicator() {
    if [[ "$(uname -r)" =~ "WSL" ]]; then
        echo -en ">>WSL"
    fi
}

# save off the original prompt, just in case we need it later
export FIG_PS1_ORIGINAL=$PS1

export PS1="
╔═ \$(__fig_ps_exit_code) ${__fig_ps_bold}${__fig_ps_yellow}\u${__fig_ps_gray}@${__fig_ps_cyan}\H\$(__fig_ps_wsl_indicator)${__fig_ps_gray}:${__fig_ps_blue}\w ${__fig_ps_gray}\t${__fig_ps_reset}\$(__git_ps1)
╚═ ${__fig_ps_lavender}\$${__fig_ps_reset} "
