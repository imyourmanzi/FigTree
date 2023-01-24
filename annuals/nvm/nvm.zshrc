# File: nvm.zshrc
# Author: Matt Manzi
# Date: 2021-02-13
#
# Defer initialization of nvm until nvm, node or a node-dependent command is
# run. Ensure this block is only run once if the rc gets sourced multiple times
# by checking whether __init_nvm is a function.

whence __init_nvm > /dev/null || if [ -s "$HOME/.nvm/nvm.sh" ]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"
    declare -a __node_commands=('nvm' 'node' 'npm' 'npx' 'yarn' 'pnpm')
    
    # only update the command list if the variable was set
    # (avoids adding an empty item to the list and causing a minor error)
    if (( ${+INIT_NVM_COMMANDS} )); then
        __node_commands+=( "${INIT_NVM_COMMANDS[@]}" )
    fi
    
    # faster, less flexible version of nvm_find_nvmrc
    function __found_nvmrc() {
        local path_
        path_="${PWD}"

        while [ "${path_}" != "" ] && [ ! -f "${path_}/.nvmrc" ]; do
            path_=${path_%/*}
        done

        if [ -z "${path_}" ]; then
            return 1
        else
            return 0
        fi
    }

    function __load_nvmrc() {
        __found_nvmrc || return

        local nvmrc_path="$(nvm_find_nvmrc)"

        if [ -n "$nvmrc_path" ]; then
            local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

            if [ "$nvmrc_node_version" = "N/A" ]; then
                nvm install
            elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
                nvm use
            fi
        fi
    }

    function __init_nvm() {
        # don't let non-tty calls trigger init (`[ -t 0 ]' is recommended over `tty -s')
        if [ ! -t 0 ]; then
            echo -n "${DEFAULT_NVM_STATUS:=none}"
            return
        fi

        # undo those aliases and actually init nvm
        for i in "${__node_commands[@]}"; do unalias $i; done
        [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR"/nvm.sh
        
        # auto nvm use on `cd'
        autoload -U add-zsh-hook
        add-zsh-hook chpwd __load_nvmrc
        __load_nvmrc
        
        # cleanup
        unset __node_commands
        unset -f __init_nvm
    }

    # alias all of the node commands to init before using nvm or node
    function __nvm_init_alias() {
        # initialize nvm if we haven't yet
        whence __init_nvm > /dev/null && __init_nvm

        # run requested command
        $@
    }
    for i in "${__node_commands[@]}"; do alias $i='__nvm_init_alias '$i; done
fi
