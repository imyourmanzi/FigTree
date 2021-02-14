# File: garden.zshrc
# Author: Matt Manzi
# Date: 2021-02-13
#
# Garden (base environment configuration) for all devices running a zsh shell.

FIG_RC=".zshrc"
FIG_OS="$(uname -s | tr '[:upper:]' '[:lower:]')"
__figMacOS="darwin"
__figLinux="linux"
alias fig='cd $FIG_HOME'

if [[ -z "$FIG_HOME" ]]; then
    echo -ne "\033[1;31m[ERROR]"
    echo -e "\033[0m \$FIG_HOME variable not set!  Check that is being defined."
    echo
    read -p "Shell will exit on <return>"
    exit 1
fi

# add amendments our soil, i.e. the shell environment
for f in "$FIG_HOME/annuals/amendments"/*/*"$FIG_RC"; do
    source "$f"
done