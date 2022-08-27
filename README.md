# Fig Tree

A command line configuration utility to ensure a consistent experience across every terminal.

## Installation and Usage

1. `git clone https://github.com/imyourmanzi/FigTree.git ~/.fig`

1. (Optional) Exclude certain seeds: `cp ~/.fig/default.noseed ~/.fig/.noseed` and then uncomment the ones to exclude

1. `~/.fig/plant`
   1. `FIG_DEBUG=true ~/.fig/plant` for debugging detail
      1. `FIG_TRACE=true ~/.fig/plant` for even more detail

1. Start a new shell to see it work
   1. Running `fig` will take you to your installation of Fig Tree

## Environment Variables

Fig Tree defines these custom (and potentially useful) environment variables in your shell's environment.

- `FIG_HOME`: where Fig Tree was planted (where the `./plant` script lives)

## Included Functionality

### Annuals

#### `exit`

#### Golang

#### Shell History

#### `ip`

#### `ls`

#### Memes

#### `nvm`

For your **.zshrc** file:

```shell
# use this string to change the Node version placeholder for pre-NVM init
# (note: escape sequences may not be supported by your theme)
#DEFAULT_NVM_CURRENT=""
# use this array to add to the default list of commands that require Node
#INIT_NVM_COMMANDS=('mynospacecommand')
```

#### Oh My Zsh

In **.zshrc**, all Oh My Zsh configuration variables should be set before the `source ...` line for FigTree. Use `OMZ_PLUGINS` for the `plugins` variable.
Use `OMZ_THEME_RANDOM_CANDIDATES` for the `ZSH_THEME_RANDOM_CANDIDATES` variable.

#### `persist`

#### Shell Prompt

#### `pwd`

#### `show-files`

#### Swift

#### `up`

#### Vim

#### Word Jump

### Perennials

#### Darwin (macOS)

#### Git

_May prompt you for input_

#### iTerm2

#### Rectangle

_Requires manual intervention_

#### SSH

#### macOS Terminal

#### Vim

#### Xcode

#### Zsh `compinit`

_Requires manual intervention_
