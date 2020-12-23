# File: simple.zshrc
# Author: Matt Manzi
# Date: 2020-09-18
#
# Configuration for simple systems with a zsh shell.


#### FigTree ####
# load OS config
source "$FIG_HOME/os/$(uname -s | tr '[:upper:]' '[:lower:]').zshrc"


#### Oh My Zsh ####
# ...
source $ZSH/oh-my-zsh.sh
