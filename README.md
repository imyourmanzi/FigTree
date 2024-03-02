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

1. Run `fig update` to pull latest changes from your upstream

1. Run `fig repot` to rerun `plant` on an existing installation

## Environment Variables

Fig Tree defines these custom (and potentially useful) environment variables in your shell's environment.

- `FIG_HOME`: where Fig Tree was planted (including where the [**plant**](/plant) script lives)

## Included Functionality

### [Annuals](/annuals/)

#### `bat`

If available, use [`bat`](https://github.com/sharkdp/bat) instead of `cat`.

#### `exit`

Simple alias of `x` to exit current shell session.  Ctrl-D might be faster for some but I've always liked single letter aliases.

#### Golang

Set your [Golang](https://go.dev) install location to be `$HOME/.go`, which I found helped with things, particularly on macOS.

#### Homebrew

Set up conveniences for [Homebrew](https://brew.sh) that you probably want anyway (e.g. update `$PATH`, tab completion).

#### `ip`

My preferred defaults for the `ip` command (there was a time when I was using this a lot).

#### `ls` or `eza`

If available, use [eza](https://github.com/eza-community/eza) and alias to `ls`/etc. to it.

Otherwise, just provide some of my preferred defaults for vanilla `ls`.

#### Memes

Enjoy some silly SFW aliases.

- `kk`
- `imdone`

#### `nvm`

Improvements I made to [`nvm`](https://github.com/nvm-sh/nvm).  Get the full details [here](https://www.notion.so/imyourmanzi/Faster-Shell-Starts-d312a841d5894605a021e13e4a762cd0?pvs=4#5f94be5b5b854e0d91a68244a2bc022c).

For your **.zshrc** file:

```shell
# use this string to change the Node version placeholder for pre-nvm init
# (note: escape sequences may not be supported by your theme)
#DEFAULT_NVM_CURRENT=""
# use this array to add to the default list of commands that require Node
#INIT_NVM_COMMANDS=('mynospacecommand')
```

#### Oh My Zsh

Play nicely with [Oh My Zsh](https://ohmyz.sh).

In **.zshrc**, all Oh My Zsh configuration variables should be set before the `source ...` line for Fig Tree.

##### Themes

Use `OMZ_THEME_RANDOM_CANDIDATES` for the `ZSH_THEME_RANDOM_CANDIDATES` variable.

##### Plugins

By default, these plugins are enabled:

- `git`
- `fzf` (used for history and recursive search)

Use `OMZ_PLUGINS` in the same way you'd define the `plugins` variable to override the defaults.

#### `persist`

If you need to keep your macOS system from sleeping/idling, now you'll be able to do that with infinite more cool-factor, and you can avoid burn-in.

#### `pwd`

My preferred defaults for `pwd`.

#### pyenv

My preferred default configuration for [pyenv](https://github.com/pyenv/pyenv).

#### Rust

Set your [Rust](https://www.rust-lang.org) install location to be `$HOME/.go`, which I found helped with things, particularly on macOS.

#### Shell History

My preferred configuration defaults for shell history (Bash only).

#### Shell Prompt

My preferred default shell prompt (Bash only).

#### `show-files`

macOS alias to quickly show or hide hidden files in Finder.

#### Swift

My preferred configuration defaults for Swift developments.

#### `up`

Shortcut for `cd ..[/..[/..[ ... ]]]`.

Usage: `up` or `up <n>` (e.g. `up 2` to go up two directories instead of the default 1).

#### Vim

My preferred defaults for using Vim.

#### Word Jump

Allow Opt–Left/Opt-Right navigation around words in your current command.

### [Perennials](/perennials/)

**Special Case: Grown Perennials**

Perennials that are "grown" are ones that copy in an existing configuration file (if present) and modify it. Then, they link that final (grown) version back to where it needs to be.

The only way to update a grown perennial with changes from an upstream repository (i.e. with changes that were not directly made to the **.grown** file) is to re-run the [**plant**](/plant) script.

#### APT

_Will prompt you for input and ask for root permissions to run `apt install`._

If [Homebrew](#homebrew-1) is installed, that will be the preferred package manager and this perennial will not run.

Packages installed:

- cmatrix
- eza (aliased to `ls`)
- bat (may be `batcat`, aliased to `cat`)
- ripgrep (`rg`)
- fd-find (`fdfind`)

#### Homebrew

_Will prompt you for input if [Homebrew](brew.sh) is installed._

This is the favored package manager. Even if your system has multiple installed/available, only Homebrew will be used.

Packages installed:

- cmatrix
- eza (aliased to `ls`)
- bat (aliased to `cat`)
- btop
- ripgrep (`rg`)
- fd

#### macOS

Make Bash on macOS work more like a Linux shell and ensure that **.bash_profile** calls the **.bashrc**.

#### Fonts

Install [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts) so you can have fancy icons/etc., needed for various Oh My Zsh themes.

#### [grown] Git

My preferred Git configurations.

_May prompt you for input._

#### iTerm2

A few [iTerm2](https://iterm2.com) profiles that might be handy and look cool.

- Fig Tree Dark (Double Line): simple dark theme profile with some preselected Oh My Zsh themes that have two-line prompts (shortcut: Ctrl-Cmd-W)
- Fig Tree Dark (Node): simple dark theme profile with some preselected Oh My Zsh themes that are handy for Node.js development (shortcut: Ctrl-Cmd-N)
- Fig Tree Dark (Single Line): simple dark theme profile with some preselected Oh My Zsh themes that have one-line prompts (shortcut: Ctrl-Cmd-S)

#### Rectangle

_Requires manual steps._

My preferred defaults for [Rectangle](https://github.com/rxhanson/Rectangle).

#### SSH

Default to using an ED25519 SSH key for `github.com`.

#### macOS Terminal

Simple dark theme profile for the built-in macOS Terminal application.

#### Vim

My preferred defaults for using Vim.

#### Xcode

A variety of Xcode themes.

- cHAoS: exactly how it sounds—give it a try!
- mz (Dark): simple dark theme
- mz (Light): simple light theme
- mz Presentation (Dark): simple dark theme with large fonts
- mz Presentation (Light): simple light theme with large fonts
- mzDefault: my default Xcode theme
- Quiet Light: mimicking the VS Code built-in theme "Quiet Light"
- Red: mimicking the VS Code built-in theme "Red"
