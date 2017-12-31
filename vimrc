
"Tab settings {{{
set expandtab
set softtabstop=4
set shiftwidth=4
set smartindent
" }}}

set nocompatible

if has ('statusline') " {{{
  set laststatus=2
  set statusline=\ [%02n]\ %<%f\ %y\ %m\ %=\ line:%l/%L\ col:%03c\ %p%%\ 
endif " }}}

" VIM UI {{{
set incsearch
set hlsearch
set ignorecase smartcase
" }}}

" pathogen setup {{{
execute pathogen#infect()
syntax on
filetype plugin indent on
" }}}

" VIM theme {{{
" syntax enable
" set background=dark
" set background=light
" colorscheme solarized
" }}}
