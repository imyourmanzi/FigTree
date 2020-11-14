# File: simple.cshrc
# Author: Matt Manzi
# Date: 2020-09-18
#
# Configuration for simple systems with a tcsh shell.


#### FigTree ####
# load OS config
set sysname = `uname -s | tr '[:upper:]' '[:lower:]'`
source "$fig_home/os/$sysname.cshrc"
