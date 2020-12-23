# File: darwin.bashrc
# Author: Matt Manzi
# Date: 2019-01-03
#
# Configuration for macOS devices with a bash shell.


#### FigTree ####
# set OS shell varibales for later config
_go="$HOME/Code/.go"

# load core config
source "$FIG_HOME/shell/core.bashrc"


#### bash ####
# stop telling me not to use 
export BASH_SILENCE_DEPRECATION_WARNING=1


#### swift ####
# use the latest Swift toolchain
export TOOLCHAINS=swift


#### ls ####
# realias since macOS doesn't like --color (use -G instead)
alias ll='ls -FhlG'
alias la='ls -aFhlG'
alias l='ls -CFG'


#### macOS Hidden Files ####
_showFiles() {
    action="$1"
    # show them by default
    if [[ -z "$action" ]]; then
        action="YES"
    fi
    defaults write com.apple.finder AppleShowAllFiles "$action"
    killall Finder
}
alias showFiles='_showFiles'
