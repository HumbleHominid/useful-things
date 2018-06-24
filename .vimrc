" No vi compatible
set nocompatible

" Adjusting terminal stuff
set term=builtin_ansi

" Helps force plugins
filetype off

" Enable syntax highlighting
syntax on

" For loading plugins
filetype plugin indent on

" Some sequrity idk
set modelines=0

" Display cursor position on last line of screen
set ruler

" cursor
set visualbell

" Encoding
set encoding=utf-8

" Tabs
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" Turn on listing
set list

" Visualize tabs and newlines
set listchars=tab:→\ ,trail:∙,nbsp:•

" Colors
highlight Visual ctermbg=0 ctermfg=7
highlight Function ctermfg=1
highlight Identifier ctermfg=5
