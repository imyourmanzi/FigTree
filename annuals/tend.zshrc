# File: tend.zshrc
# Author: Matt Manzi
# Date: 2021-02-13
#
# Tend your garden and plant annuals.
# Prerequisites:
# - FIG_HOME is set to the Fig Tree project directory.

if [[ -z "${FIG_HOME+x}" ]]; then
    echo -ne "\033[38;5;160m"
    echo -e "[FATL] FIG_HOME variable not set!  Check that it is being defined."
    echo -e "\033[0m"
    read -p "Shell will exit on <return>"
    exit 1
fi

source "${FIG_HOME}/tool-shed/globals.zsh"

alias fig='cd $FIG_HOME'

# enable Zsh completion system (https://stackoverflow.com/a/67161186/15114520)
autoload -Uz compinit; compinit
autoload -U +X bashcompinit && bashcompinit

# plant annuals in the garden
for annual in "${FIG_HOME}/annuals"/*/*"${FIG_RC}"; do
    source "${annual}"
done
