" File: core.vimrc
" Author: Matt Manzi
" Date: 2018
"
" Inspired by the example at http://vim.wikia.com/wiki/Example_vimrc written by
" http://vim.wikia.com/wiki/Vim_on_Freenode

" This is highly recommended by the original author.  Maybe I'll understand it
" one day.
set nocompatible

" Let Vim try to figure out the file type based on the contents of the file
" and turn on auto-indenting
filetype indent on


"-----------------------------------------------------------------------------+
" Presentation and Visual                                                     |
"                                                                             |

" Enable syntax highlighting
if has("syntax")
    syntax on
endif

" Colorscheme - eventually make my own that's a combination of delek and pablo
colo delek

" Line numbers on the left
"set number

" Cursor current line/col number in status bar
set ruler

"-----------------------------------------------------------------------------+
" Editing                                                                     |
"                                                                             |

" Allow backspace over autoindent, line breaks, and start of insert action
set backspace=indent,eol,start

" Indent to the same level as the previous line after hitting return
set autoindent

" Allow toggle of 'paste' mode, which gets rid of the horrible pasting triangle
" of hell due to 'autoindent'
"   Similar to 'set autoindent' then 'set noautoindent'
set pastetoggle=<F10>

" Don't fail a command if a file has unsaved changes, ask first if the file
" should be saved
set confirm

" Set soft tabs for indent as 4 spaces (one bullet per command):
"   - The largest size of a tab character can be 8 'spaces'
"   - Don't let vim insert combo of spaces and tabs to simulate a hard tabstop
"   - Let tab key insert spaces instead of tab characters
"   - Set the actual size of a 'tab' or 'indent' as 4 spaces
"   - Make Vim more aware of tab stops
"   These settings from the wonderful Laurence Gonsalves' answer:
"     http://stackoverflow.com/a/1878983
set tabstop=8
set softtabstop=0
set expandtab
set shiftwidth=4
set smarttab

" Set tabbing for specific files
"   For makefile files - 8-space hard tabs (on picky systems)
autocmd Filetype make setlocal shiftwidth=8 noexpandtab
