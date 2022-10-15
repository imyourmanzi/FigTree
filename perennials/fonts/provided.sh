#!/usr/bin/env bash
# File: fonts/provided.sh
# Author: Matt Manzi
# Date: 2022-10-14
#
# Prerequisites:
# - FIG_HOME is set to the Fig Tree project directory.

if [[ -z "${FIG_HOME+x}" ]]; then
    echo -ne "\033[38;5;160m"
    echo -e "[FATL] FIG_HOME variable not set!  Check that it is being defined."
    echo -e "\033[0m"
    read -p "Shell will exit on <return>"
    exit 1
fi

#### Includes
source "${FIG_HOME}/tool-shed/logger.bash"
source "${FIG_HOME}/tool-shed/globals.bash"
source "${FIG_HOME}/tool-shed/yn_prompt.bash"

#### Globals
__PERENNIAL_DIR="perennials/fonts"


#### Main Script

logDebug "Planting perennial: ${__PERENNIAL_DIR}"

if type brew &>/dev/null; then
    logInfo "Installing Homebrew Fonts cask and Roboto Mono Nerd Font"
    brew tap -q homebrew/cask-fonts
    brew install --cask -q font-roboto-mono-nerd-font
elif [[ "$FIG_OS" == "$__FIG_MAC_OS" ]]; then
    logInfo "Installing Roboto Mono Nerd Font manually"
    cd ~/Library/Fonts
    curl -sfLo "RobotoMono Nerd Font Regular Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/RobotoMono/Regular/complete/Roboto%20Mono%20Nerd%20Font%20Complete.ttf
    curl -sfLo "RobotoMono Nerd Font Bold Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/RobotoMono/Bold/complete/Roboto%20Mono%20Bold%20Nerd%20Font%20Complete.ttf
    curl -sfLo "RobotoMono Nerd Font Italic Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/RobotoMono/Italic/complete/Roboto%20Mono%20Italic%20Nerd%20Font%20Complete.ttf
    curl -sfLo "RobotoMono Nerd Font Light Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/RobotoMono/Light/complete/Roboto%20Mono%20Light%20Nerd%20Font%20Complete.ttf
    curl -sfLo "RobotoMono Nerd Font Medium Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/RobotoMono/Medium/complete/Roboto%20Mono%20Medium%20Nerd%20Font%20Complete.ttf
    curl -sfLo "RobotoMono Nerd Font Thin Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/RobotoMono/Thin/complete/Roboto%20Mono%20Thin%20Nerd%20Font%20Complete.ttf
    curl -sfLo "RobotoMono Nerd Font Bold-Italic Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/RobotoMono/Bold-Italic/complete/Roboto%20Mono%20Bold%20Italic%20Nerd%20Font%20Complete.ttf
    curl -sfLo "RobotoMono Nerd Font Light-Italic Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/RobotoMono/Light-Italic/complete/Roboto%20Mono%20Light%20Italic%20Nerd%20Font%20Complete.ttf
    curl -sfLo "RobotoMono Nerd Font Medium-Italic Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/RobotoMono/Medium-Italic/complete/Roboto%20Mono%20Medium%20Italic%20Nerd%20Font%20Complete.ttf
    curl -sfLo "RobotoMono Nerd Font Thin-Italic Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/RobotoMono/Thin-Italic/complete/Roboto%20Mono%20Thin%20Italic%20Nerd%20Font%20Complete.ttf
elif [[ "$FIG_OS" == "$__FIG_LINUX" ]]; then
    logInfo "Installing Roboto Mono Nerd Font manually"
    mkdir -p ~/.local/share/fonts
    cd ~/.local/share/fonts
    curl -sfLo "RobotoMono Nerd Font Regular Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/RobotoMono/Regular/complete/Roboto%20Mono%20Nerd%20Font%20Complete.ttf
    curl -sfLo "RobotoMono Nerd Font Bold Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/RobotoMono/Bold/complete/Roboto%20Mono%20Bold%20Nerd%20Font%20Complete.ttf
    curl -sfLo "RobotoMono Nerd Font Italic Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/RobotoMono/Italic/complete/Roboto%20Mono%20Italic%20Nerd%20Font%20Complete.ttf
    curl -sfLo "RobotoMono Nerd Font Light Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/RobotoMono/Light/complete/Roboto%20Mono%20Light%20Nerd%20Font%20Complete.ttf
    curl -sfLo "RobotoMono Nerd Font Medium Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/RobotoMono/Medium/complete/Roboto%20Mono%20Medium%20Nerd%20Font%20Complete.ttf
    curl -sfLo "RobotoMono Nerd Font Thin Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/RobotoMono/Thin/complete/Roboto%20Mono%20Thin%20Nerd%20Font%20Complete.ttf
    curl -sfLo "RobotoMono Nerd Font Bold-Italic Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/RobotoMono/Bold-Italic/complete/Roboto%20Mono%20Bold%20Italic%20Nerd%20Font%20Complete.ttf
    curl -sfLo "RobotoMono Nerd Font Light-Italic Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/RobotoMono/Light-Italic/complete/Roboto%20Mono%20Light%20Italic%20Nerd%20Font%20Complete.ttf
    curl -sfLo "RobotoMono Nerd Font Medium-Italic Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/RobotoMono/Medium-Italic/complete/Roboto%20Mono%20Medium%20Italic%20Nerd%20Font%20Complete.ttf
    curl -sfLo "RobotoMono Nerd Font Thin-Italic Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/RobotoMono/Thin-Italic/complete/Roboto%20Mono%20Thin%20Italic%20Nerd%20Font%20Complete.ttf
fi
