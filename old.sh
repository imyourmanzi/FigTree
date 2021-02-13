






################################################################################
################### TODO: always check symlinks resolve to correct path

## constants

# config file values
CFG_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export CFG_HOME
CORE="core"

# valid options and arguments
OPT_SHELL="s"
SHELL_BASH="bash"
SHELL_TCSH="tcsh"
SHELL_ZSH="zsh"

OPT_OS="o"
OS_LINUX="Linux"
OS_MAC="Darwin"

OPT_TYPE="t"
YES="y"

OPT_EXTRAS="e"

OPT_HELP="h"

# specific file names
OH_MY_ZSH_RES="https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh"
OH_MY_ZSH_SH="$(pwd)/install.sh"
PROFILE_BASH=".bash_profile"
RC_BASH=".bashrc"
RC_TCSH=".cshrc"
RC_ZSH=".zshrc"
SSH_CFG="$CORE.ssh_config"
SSH_DIR=".ssh"
SSH_CFG_NAME="config"
ITERM_PREF_NAME="com.googlecode.iterm2"
ITERM_PREF_KEY="PrefsCustomFolder"
ITERM_PREF_VALUE="$CFG_HOME/$CORE.iterm"
EXTRAS=("Vim:.vimrc")


## defaults

shell="$SHELL_ZSH"
rc="$RC_ZSH"
os="$(uname -s)"
type="simple"
extras_only=""


## functions

help() {
    echo
    echo "Usage: ./cliinit.sh [-s SHELL] [-o OS] [-t TYPE] [-e]"
    echo "Options and Arguments"
    echo "  -s SHELL  Sets the shell that will be configured, using the appropriate RC"
    echo "            files.  Default: $SHELL_ZSH"
    echo "  -o OS     Sets the operating system to configure.  Default: $(uname -s)"
    echo "  -t TYPE   Sets the CLI type (this is a standard way to subdivide machines"
    echo "            after operating system.  Default: $TYPE_SIMPLE"
    echo "  -e        Skip shell configuration and jump directly to prompting for extras"
    echo "            (ideal for shells that have already been configured"
}


config_shell() {

    # report current settings to user
    echo "Config initialization:"
    echo " - Shell:            $shell"
    echo " - Operating system: $os"
    echo " - System type:      $type"
    echo " - Config home:      $CFG_HOME"
    echo "Type enter to continue or ^C to abort"
    read

    # check the combinations exist
    if [ ! -e "$CFG_HOME/type/$type$rc" ]; then
        echo "That config combination is not supported."
        exit 1
    fi

    # replace bash_profile on macOS
    if [ "$os" == "$OS_MAC" ] && [ "$shell" == "$SHELL_BASH" ]; then
        echo "Replace macOS $PROFILE_BASH:"

        # check if a profile is already linked and handle
        if [ ! "$HOME/$PROFILE_BASH" -ef "$CFG_HOME/shell/$CORE$PROFILE_BASH" ]; then

            if [ -e "$HOME/$PROFILE_BASH" ]; then
                echo -n "WARN: Found existing file, renaming to old$PROFILE_BASH..."
                mv "$HOME/$PROFILE_BASH" "$HOME/old$PROFILE_BASH"
                echo "done"
            fi

            echo -n "Linking new $PROFILE_BASH..."
            ln -s "$CFG_HOME/shell/$CORE$PROFILE_BASH" "$HOME/$PROFILE_BASH"
            echo "done"

        else
            echo "Proper link exists, no further action needed"
        fi
        echo
    fi

    # update current rc file to source the configs
    echo "Update current rc file:"
    case "$shell" in
        "$SHELL_BASH")
            add_rc="
#### Added by cliinit.sh ####
CFG_HOME=\"$CFG_HOME\"
CFG_SHELL=\"$shell\"
CFG_OS=\"$os\"
CFG_TYPE=\"$type\"
export CFG_HOME
export CFG_SHELL
export CFG_OS
export CFG_TYPE
source \"$CFG_HOME/type/$type$RC_BASH\"

# add device-specific configuration here
    "
            echo -n "Appending to $HOME/$RC_BASH:$add_rc..."
            echo "$add_rc" >> "$HOME/$RC_BASH"
            echo "done"
            ;;

        "$SHELL_TCSH")
            add_rc="
#### Added by cliinit.sh ####
set cfg_home = \"$CFG_HOME\"
set cfg_shell=\"$shell\"
set cfg_os=\"$os\"
set cfg_type=\"$type\"
source \"$CFG_HOME/type/$type$RC_TCSH\"

# add device-specific configuration here
    "
            echo -n "Appending to $HOME/$RC_TCSH:$add_rc..."
            echo "$add_rc" >> "$HOME/$RC_TCSH"
            echo "done"
            ;;

        "$SHELL_ZSH")
            ################ TODO: move omz comment to be added after user says they're using omz
            add_rc="
#### Original Oh My Zsh config was moved to oh-my.zshrc ####

#### Added by cliinit.sh ####
export CFG_HOME=\"$CFG_HOME\"
export CFG_SHELL=\"$shell\"
export CFG_OS=\"$os\"
export CFG_TYPE=\"$type\"
source \"$CFG_HOME/type/$type$RC_ZSH\"

# add device-specific configuration here
    "
            ############# TODO: ask and handle if omz is already installed
            echo "Would you like to install Oh My Zsh?"
            echo "More info here: github.com/robbyrussell/oh-my-zsh"
            read -p "($YES/n) [default=y]: " ohmy
            if [ "$ohmy" != "n" ]; then

                # check that git is installed
                if [ ! $(which git) ]; then
                    echo "ERROR: git is not installed, required for Oh My Zsh, please install it, then re-run"
                    exit 1
                fi

                # check for a way to download the installer script
                if [ $(which wget) ]; then
                    echo -n "wget-ing Oh My Zsh installer..."
                    wget -O "$OH_MY_ZSH_SH" "$OH_MY_ZSH_RES"
                    echo "done"
                elif [ $(which curl) ]; then
                    echo -n "curling Oh My Zsh installer..."
                    curl -fsSL "$OH_MY_ZSH_RES" > "$OH_MY_ZSH_SH"
                    echo "done"
                else
                    echo "ERROR: Neither curl nor wget are installed, please download this script"
                    echo "$OH_MY_ZSH_RES"
                    echo "to this location: $OH_MY_ZSH_SH"
                    read -p "and press enter when you're ready..."
                fi

                chmod u+x "$OH_MY_ZSH_SH"
                sh -c "\"$OH_MY_ZSH_SH\"" --unattended
                rm "$OH_MY_ZSH_SH"
            fi

            echo -n "Creating new $HOME/$RC_ZSH with contents:$add_rc..."
            echo "$add_rc" >> "$HOME/$RC_ZSH"
            echo "done"
            ;;
    esac
    echo

}


config_extras() {

    # link OpenSSH config?
    read -p "Would you like to configure SSH? ($YES/n) [default=n]: " setup
    if [ "$setup" == "$YES" ]; then

        # check SSH dir exists and handle
        if [ ! -d "$HOME/$SSH_DIR" ]; then
            echo -n "$SSH_DIR does not exist, creating it..."
            mkdir "$HOME/$SSH_DIR"
            echo "done"
        fi

        # check if the a config file is already linked and handle
        if [ ! "$HOME/$SSH_DIR/$SSH_CFG_NAME" -ef "$CFG_HOME/$SSH_CFG" ]; then

            if [ -e "$HOME/$SSH_DIR/$SSH_CFG_NAME" ]; then
                echo -n "WARN: Found existing file, renaming to old.$SSH_CFG_NAME..."
                mv "$HOME/$SSH_DIR/$SSH_CFG_NAME" "$HOME/$SSH_DIR/old.$SSH_CFG_NAME"
                echo "done"
            fi

            echo -n "Linking new $SSH_CFG..."
            ln -s "$CFG_HOME/$SSH_CFG" "$HOME/$SSH_DIR/$SSH_CFG_NAME"
            echo "done"

        else
            echo "Proper link exists, no further action needed"
        fi
        echo
    fi

    # update iTerm2 prefs location?
    if [ "$os" == "$OS_MAC" ]; then
        read -p "Would you like to configure iTerm2? ($YES/n) [default=n]: " setup
        if [ "$setup" == "$YES" ]; then

            # check if the prefs exist and the current value
            val="$(defaults read $ITERM_PREF_NAME $ITERM_PREF_KEY)"
            ret=$?
            if [ "$ret" -ne "0" ]; then
                echo "ERROR: iTerm2 is not installed (or the configuration file is missing)"
            else

                if [ "$val" == "$ITERM_PREF_VALUE" ]; then
                    echo "Proper link exists, no further action needed"
                else
                    echo -n "Setting iTerm2 preferences..."
                    defaults write $ITERM_PREF_NAME $ITERM_PREF_KEY $ITERM_PREF_VALUE
                    echo "done"
                fi

            fi
            echo
        fi
    fi

    # configure home dir extras (i.e. RCs)?
    for extra in ${EXTRAS[@]}; do
        ex_name="$(echo "$extra" | cut -d ':' -f 1 )"
        ex_cfg="$(echo "$extra" | cut -d ':' -f 2 )"
        read -p "Would you like to configure $ex_name? ($YES/n) [default=n]: " setup

        if [ "$setup" == "$YES" ]; then
            echo "Replace $ex_name config:"

            # check if an extra is already linked
            if [ ! "$HOME/$ex_cfg" -ef "$CFG_HOME/$CORE$ex_cfg" ]; then

                if [ -e "$HOME/$ex_cfg" ]; then
                    echo -n "WARN: Found existing conf, renaming to old$ex_cfg..."
                    mv "$HOME/$ex_cfg" "$HOME/old$ex_cfg"
                    echo "done"
                fi

                echo -n "Linking new $ex_cfg..."
                ln -s "$CFG_HOME/$CORE$ex_cfg" "$HOME/$ex_cfg"
                echo "done"

            else
                echo "Proper link exists, no further action needed"
            fi
            echo
        fi
    done

}

# get command line options/arguments for initialization settings
OPTIND=1 # reset in case getopts has been used previously in the shell.
while getopts ":$OPT_SHELL:$OPT_OS:$OPT_TYPE:$OPT_EXTRAS$OPT_HELP" opt; do
    case "$opt" in
        "$OPT_SHELL")
            case "$OPTARG" in
                "$SHELL_BASH")
                    shell=$SHELL_BASH
                    rc=$RC_BASH
                    ;;
                "$SHELL_TCSH")
                    shell=$SHELL_TCSH
                    rc=$RC_TCSH
                    ;;
                "$SHELL_ZSH")
                    shell=$SHELL_ZSH
                    rc=$RC_ZSH
                    ;;
                *)
                    echo "Shell \"$OPTARG\" unsupported."
                    exit 1
                    ;;
            esac
            ;;
        "$OPT_OS")
            case "$OPTARG" in
                "$OS_LINUX")
                    os=$OS_LINUX
                    ;;
                "$OS_MAC")
                    os=$OS_MAC
                    ;;
                *)
                    echo "OS \"$OPTARG\" unsupported."
                    exit 1
                    ;;
            esac
            ;;
        "$OPT_TYPE")
            type="$OPTARG"
            match="$(ls -1 $CFG_HOME/type/$type.* 2> /dev/null | wc -l)"
            if [ "$match" -le "0" ]; then
                echo "Type \"$OPTARG\" unsupported."
                exit 1
            fi
            ;;
        "$OPT_EXTRAS")
            extras_only=$YES
            ;;
        "$OPT_HELP")
            help
            exit 0
            ;;
        ":")
            echo "Option -$OPTARG requires an argument."
            help
            exit 1
            ;;
        "?")
            echo "Option -$OPTARG is invalid"
            help
            exit 1
            ;;
    esac
done

if [ "$extras_only" != "$YES" ]; then
    config_shell
fi
config_extras

if [ "$extras_only" != "$YES" ]; then
    echo
    echo "Completed CLI config initialization script!"
    echo "Note: Shell and enviroment must be reloaded for changes to take effect"
    echo "The easiest way to do this is open a new shell or log off then back on"
else
    echo
    echo "Extras have been configured!"
    echo "You may only need to restart configured programs"
fi
