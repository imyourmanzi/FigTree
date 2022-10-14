# File: oh_my_zsh.zshrc
# Author: Matt Manzi
# Date: 2021-02-13
#
# The containing directory is prefixed with an `_` to ensure it runs first in setup.  Oh
# My Zsh sets a lot of aliases that we may want to override later (e.g. aliases for `ls`).

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# if Oh My Zsh is installed, then set it up
if [[ -d "$ZSH" ]]; then
    __zshCustomThemes="$ZSH/custom/themes"

    function __canUseSpaceship() {
        { # version check block
            [[ "$(echo "$ZSH_VERSION" | cut -d'.' -f1)" -gt "5" ]] || \
            {
                [[ "$(echo "$ZSH_VERSION" | cut -d'.' -f1)" == "5" ]] && \
                [[ "$(echo "$ZSH_VERSION" | cut -d'.' -f2)" -ge "2" ]]
            }
        } && { # dependency check block
            type brew &> /dev/null && \
            {
                [[ -n "$(compgen -G "$(brew --prefix)/Caskroom/*nerd-font")" ]] || \
                [[ -n "$(compgen -G "$(brew --prefix)/Caskroom/*powerline")" ]]
            } && \
            [[ -h "$__zshCustomThemes/spaceship.zsh-theme" ]]
        }
        return $?
    }

    function __addThemeIfInstalled() {
        local theme="$1"

        if [[ "$theme" == "spaceship" ]] && __canUseSpaceship; then
            ZSH_THEME_RANDOM_CANDIDATES+=("spaceship")
        elif [[ -f "$__zshCustomThemes/${theme}.zsh-theme" ]]; then
            ZSH_THEME_RANDOM_CANDIDATES+=("$theme")
        fi
    }
    

    # default zsh themes (all double-liners)
    declare -a ZSH_THEME_RANDOM_CANDIDATES=("bira" "darkblood" "dstufft" "fino-time")
    __addThemeIfInstalled "uysal"
    __addThemeIfInstalled "spaceship"

    # if the iTerm profile indicates a specific theme category, default to those
    case "$ITERM_PROFILE" in
    *Node*)
        ZSH_THEME_RANDOM_CANDIDATES=("bureau")
        __addThemeIfInstalled "nodeys"
        __addThemeIfInstalled "spaceship"
        ;;
    *Single*)
        # simple single-line theme options
        ZSH_THEME_RANDOM_CANDIDATES=("nicoulaj" "theunraveler")
        ;;
    esac

    if (( ${+OMZ_THEME_RANDOM_CANDIDATES} )); then
        ZSH_THEME_RANDOM_CANDIDATES=(${OMZ_THEME_RANDOM_CANDIDATES[@]})
    fi

    ZSH_THEME="${ZSH_THEME:="random"}"

    # history timestamps
    HIST_STAMPS="${HIST_STAMPS:="%m/%d/%y %T "}"

    # hyphen-insensitive completion, case sensitive completion must be off
    # _ and - will be interchangeable
    HYPHEN_INSENSITIVE="${HYPHEN_INSENSITIVE:="true"}"

    # disable marking untracked files under VCS as dirty
    # makes repository status check for large repositories much, much faster
    DISABLE_UNTRACKED_FILES_DIRTY="${DISABLE_UNTRACKED_FILES_DIRTY:="true"}"

    # load a few of your favorite plugins by setting OMZ_PLUGINS in your .zshrc
    __DEFAULT_PLUGINS_ENABLED=("git")
    if type fzf &> /dev/null; then
        __DEFAULT_PLUGINS_ENABLED+=("fzf")
    fi
    plugins=(${(A)OMZ_PLUGINS:=$__DEFAULT_PLUGINS_ENABLED})

    # start up omz
    source "$ZSH/oh-my-zsh.sh"
fi
