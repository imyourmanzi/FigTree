# File: simple.bashrc
# Author: Matt Manzi
# Date: 2020-09-18
#
# Configuration for simple systems with a bash shell.


#### FigTree ####
# load OS config
source "$FIG_HOME/os/$(uname -s | tr '[:upper:]' '[:lower:]').bashrc"
