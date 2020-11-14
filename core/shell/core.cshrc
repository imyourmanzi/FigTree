# File: core.cshrc
# Author: Matt Manzi
# Date: 2019-01-03
#
# Base configuration for all devices with a tcsh shell.


#### FigTree ####
set shellname = "`echo $shell | rev | cut -d '/' -f1 | rev`"
alias fig "cd $FIG_HOME"


#### builtins ####
# use this standard prompt
set prompt = "[%n@%m %c] % "

# set editor (source: https://stackoverflow.com/a/2596835)
set visual = vim
set editor = $visual


#### exit ####
alias x "exit"


#### ls ####
alias la "ls -alhF --color"
alias ll "ls -lhF --color"
alias l "ls -CF --color"


#### pwd ####
alias pwd "pwd -P" # frick a logical path


#### ip ####
alias ip "ip -c" # colorful!


#### up ####
alias up "echo This function is not supported in $shellname."


#### meme ####
alias kk "cat $FIG_HOME/yes.txt"
alias imdone "cat $FIG_HOME/donedog.txt"
