# File: server.bashrc
# Author: Matt Manzi
# Date: 2019-01-03
#
# Configuration for server systems with a bash shell.


#### FigTree ####
# load OS config
source "$FIG_HOME/os/$(uname -s | tr '[:upper:]' '[:lower:]').bashrc"


#### builtins ####
# set prompt
export PS1="\[\033[01;36m\]\u\[\033[00m\]@\[\033[32m\]\h\[\033[00m\]:\[\033[01;93m\]\W\[\033[00m\]\$ "
