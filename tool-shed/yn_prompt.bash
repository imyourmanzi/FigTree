# File: yn_prompt.bash
# Author: Matt Manzi
# Date: 2022-10-13
#
# Helper function to prompt the user with a yes or no question and then return a
# normalized value: 0 for yes, 1 for no (similar to *nix exit codes).
#
# Prerequisites:
# - FIG_HOME is set to the Fig Tree project directory.
#
# Paramters:
# 1. The text to prompt the user with (it will have a '?' appended to it)

if [[ -z "${FIG_HOME+x}" ]]; then
    echo -ne "\033[38;5;160m"
    echo -e "[FATL] FIG_HOME variable not set!  Check that it is being defined."
    echo -e "\033[0m"
    read -p "Shell will exit on <return>"
    exit 1
fi

source "${FIG_HOME}/tool-shed/logger.bash"

function ynPrompt() {
    local prompt="${1}? [Y/n] "
    local response
    logTrace "Prompting user with: $prompt"
    read -p "$prompt" response
    logTrace "User responded with: $response"

    # normalize to lowercase
    response="$(echo "$response" | tr '[:upper:]' '[:lower:]')"
    logDebug "Normalized response to: $response"

    if [[ "$response" == "y" ]] || [[ -z "$response" ]]; then
        logTrace "Returning a 'yes'"
        return 0
    else
        logTrace "Returning a 'no'"
        return 1
    fi
}
