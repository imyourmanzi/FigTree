# File: server.cshrc
# Author: Matt Manzi
# Date: 2019-01-03
#
# Configuration for servers with a tcsh shell.


#### FigTree ####
# load OS config
set sysname = `uname -s | tr '[:upper:]' '[:lower:]'`
source "$fig_home/os/$sysname.cshrc"


#### builtins ####
# set prompt
set prompt = '[%{\033[01;36m%}%n%{\033[00m%}@%{\033[32m%}%m%{\033[00m%} %{\033[01;93m%}%c%{\033[00m%}] %% '
