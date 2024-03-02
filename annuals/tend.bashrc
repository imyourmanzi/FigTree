# File: tend.bashrc
# Author: Matt Manzi
# Date: 2020-12-23
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

source "${FIG_HOME}/tool-shed/globals.bash"

function __fig() {
    if [[ -z "$@" ]]; then
        cd "$FIG_HOME"
    elif [[ "$1" == "update" ]]; then
        if git -C "$FIG_HOME" diff --quiet; then
            git -C "$FIG_HOME" pull && echo "Fig Tree has been updated" && echo "Open a new shell for changes to take effect"
        else
            echo "Cannot update while there are changes to your local copy, please 'git stash' them first"
        fi
    elif [[ "$1" == "repot" ]]; then
        "${FIG_HOME}/plant"
    fi
}

alias fig='__fig'

# plant annuals in the garden
for annual in "${FIG_HOME}/annuals"/*/*"${FIG_RC}"; do
    source "${annual}"
done
