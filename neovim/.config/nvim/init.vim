" ~/.config/nvim/init.vim

" BASIC CONF
"colorscheme koehler
" colorschemeの設定前に必要な設定を実施
source ~/.config/nvim/myutils/before_colorscheme.vim
colorscheme default
set number  " line number
"set clipboard=unnamed

set encoding=utf-8

set fileformats=unix,dos,mac

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
set softtabstop=4
set shiftwidth=4

set splitright

set diffopt+=vertical

set termguicolors

" 不可視文字
" defaultでは非表示, `set list / set nolist`で表示切り替え
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set nolist

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

" buffer
nnoremap <Leader>bp :bprev<CR>
nnoremap <Leader>bn :bnext<CR>
nnoremap <Leader>bf :bfirst<CR>
nnoremap <Leader>bl :blast<CR>
nnoremap <Leader>bd :bdelete<CR>

" Emacs Keybind in InsertMode
" CAUTION: Some keybinds are not set because they conflict with Vim's default keybinds.

" CAUTION: <UP> & <Down> conflict completion functions.
" imap <C-p> <Up>
" imap <C-n> <Down>
" imap <C-b> <Left>
" imap <C-f> <Right>
" imap <C-a> <C-o>:call <SID>home()<CR>
" imap <C-a> <home>
" imap <C-e> <End>
" imap <C-d> <Del>
" INFO: <C-h> is vim's default function.
" imap <C-h> <BS>
" imap <C-k> <C-r>=<SID>kill()<CR>

" function! s:home()
"   let start_column = col('.')
"   normal! ^
"   if col('.') == start_column
"   ¦ normal! 0
"   endif
"   return ''
" endfunction

" function! s:kill()
"   let [text_before, text_after] = s:split_line()
"   if len(text_after) == 0
"   ¦ normal! J
"   else
"   ¦ call setline(line('.'), text_before)
"   endif
"   return ''
" endfunction

" function! s:split_line()
"   let line_text = getline(line('.'))
"   let text_after  = line_text[col('.')-1 :]
"   let text_before = (col('.') > 1) ? line_text[: col('.')-2] : ''
"   return [text_before, text_after]
" endfunction

" 意外とVimのkeybindと被ることが分かったので、多くのものは設定を断念



" No Yank by 'x'
vnoremap x "_x
nnoremap x "_x

" No Ex-Mode
nnoremap Q gq


" moving
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k


" define command--------------------------

" from Kaoriya-Commands ----------
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


" extra setting --------------------------

" memory last cursor position
" if has("autocmd")
"   augroup redhat
"     " In text files, always limit the width of text to 78 characters
"     autocmd BufRead *.txt set tw=78
"     " When editing a file, always jump to the last cursor position
"     autocmd BufReadPost *
"     \ if line("'"") &gt; 0 &amp;&amp; line ("'"") &lt;= line("$") |
"     \   exe "normal! g'"" |
"     \ endif
"   augroup END
" endif
augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END


" local setting
if filereadable(expand('~/.config/nvim/local_setting.vim'))
  source ~/.config/nvim/local_setting.vim
endif

"neovim backend --------------------------

" Python3
let s:python3_nvim_backend = getenv("PYTHON3_NVIM_BACKEND")
if s:python3_nvim_backend != v:null
    let g:python3_host_prog = s:python3_nvim_backend
endif
unlet s:python3_nvim_backend

" nodejs
let s:node_nvim_backend = getenv("NODE_NVIM_BACKEND")
if s:node_nvim_backend != v:null
    let g:node_host_prog = s:node_nvim_backend
endif
unlet s:node_nvim_backend

" ruby
let s:ruby_nvim_backend = getenv("RUBY_NVIM_BACKEND")
if s:ruby_nvim_backend != v:null
    let g:ruby_host_prog = s:ruby_nvim_backend
endif
unlet s:ruby_nvim_backend


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

  " deinで無効化するものなどあれば
  if filereadable(expand('~/.config/nvim/dein_disable.vim'))
      source ~/.config/nvim/dein_disable.vim
  endif

  if filereadable(expand('~/.config/nvim/before_dein.vim'))
      source ~/.config/nvim/before_dein.vim
  endif

  " use toml
  call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})
  call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1})

  " remove trash (test)
  call map(dein#check_clean(), "delete(v:val, 'rf')")

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

