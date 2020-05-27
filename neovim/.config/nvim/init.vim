" ~/.config/nvim/init.vim

" BASIC CONF
"colorscheme koehler
set number  " line number
"set clipboard=unnamed

set autoindent
set smartindent
set cindent

set ignorecase
set smartcase
set wrapscan
set hls
set showmatch

set expandtab
set tabstop=4
set shiftwidth=4

set splitright

set diffopt+=vertical

" customize keymap------------------------

" Leader
let mapleader = "\<Space>"

" save file
nnoremap <Leader>w :w<CR>

" system clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" visual line
nmap <Leader><Leader> V

" define command--------------------------

" ref: https://nanasi.jp/articles/vim/cmdex_vim.html

" CdCurrent
command! -nargs=0 CdCurrent cd %:p:h
" VDsplit
command! -nargs=1 -complete=file VDsplit vertical diffsplit <args>
" :IminsertOff/On
command! -nargs=0 IminsertOff inoremap <buffer> <silent> <ESC> <ESC>:set iminsert=0<CR>
command! -nargs=0 IminsertOn iunmap <buffer> <ESC>
" :Scratch
"   Open a scratch (no file) buffer.
command! -nargs=0 Scratch new | setlocal bt=nofile noswf | let b:cmdex_scratch = 1
function! s:CheckScratchWritten()
  if &buftype ==# 'nofile' && expand('%').'x' !=# 'x' && exists('b:cmdex_scratch') && b:cmdex_scratch == 1
    setlocal buftype= swapfile
    unlet b:cmdex_scratch
  endif
endfunction
augroup CmdexScratch
autocmd!
autocmd BufWritePost * call <SID>CheckScratchWritten()
augroup END
" :Undiff
"   Turn off diff mode for current buffer.
command! -nargs=0 Undiff set nodiff noscrollbind wrap nocursorbind


"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein//repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein/')
  call dein#begin('~/.cache/dein/')

  " Let dein manage dein
  " Required:
  call dein#add('~/.cache/dein//repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')

  " use toml
  call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})
  call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1})

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------
