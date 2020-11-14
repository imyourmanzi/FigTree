# File: server.zshrc
# Author: Matt Manzi
# Date: 2019-11-08
#
# Configuration for server systems with a zsh shell.


#### FigTree ####
# load OS config
. "$FIG_HOME/os/$(uname -s | tr '[:upper:]' '[:lower:]').zshrc"


#### Oh My Zsh ####
ZSH_THEME="mortalscumbag"
source $ZSH/oh-my-zsh.sh
