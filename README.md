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

- `FIG_HOME`: where Fig Tree was planted (including where the [**plant**](/plant) script lives)

## Included Functionality

### Annuals

#### `exit`

#### Golang

#### Shell History

#### `ip`

#### `ls`

#### Memes

#### NVM

For your **.zshrc** file:

```shell
# use this string to change the Node version placeholder for pre-NVM init
# (note: escape sequences may not be supported by your theme)
#DEFAULT_NVM_CURRENT=""
# use this array to add to the default list of commands that require Node
#INIT_NVM_COMMANDS=('mynospacecommand')
```

#### Oh My Zsh

In **.zshrc**, all Oh My Zsh configuration variables should be set before the `source ...` line for FigTree.

##### Themes

Use `OMZ_THEME_RANDOM_CANDIDATES` for the `ZSH_THEME_RANDOM_CANDIDATES` variable.

##### Plugins

By default, these plugins are enabled:

- `git`
- `fzf` (used for history and recursive search)

Use `OMZ_PLUGINS` in the same way you'd define the `plugins` variable to override the defaults.

#### `persist`

#### Shell Prompt

#### `pwd`

#### `show-files`

#### Swift

#### `up`

#### Vim

#### Word Jump

### Perennials

**Special Case: Grown Perennials**

Perennials that are "grown" are ones that copy in an existing configuration file (if present) and modify it. Then, they link that final (grown) version back to where it needs to be.

The only way to update a grown perennial with changes from an upstream repository (i.e. with changes that were not directly made to the file) is to re-run the [**plant**](/plant) script.

#### `apt`

_Will prompt you for input and ask for root permissions to run `apt install`._

If Homebrew is installed, that will be the preferred package manager and this perennial will not run.

Packages installed:

- cmatrix
- eza
- bat
- ripgrep (`rg`)
- fd-find (`fdfind`)

#### Brew (Homebrew)

_Will prompt you for input if [Homebrew](brew.sh) is installed._

This is the favored package manager. Even if your system has multiple installed/available, only Homebrew will be used.

Packages installed:

- cmatrix
- eza
- bat
- btop
- ripgrep (`rg`)
- fd

#### Darwin (macOS)

#### Fonts

#### [grown] Git

_May prompt you for input._

#### iTerm2

#### Rectangle

_Requires manual steps if [Rectangle](https://github.com/rxhanson/Rectangle) is installed._

#### SSH

#### macOS Terminal

#### Vim

#### Xcode
