
let g:deoplete#enable_at_startup = 1
inoremap <expr><Tab> pumvisible() ? "\<DOWN>" : "\<Tab>"
inoremap <expr><S-Tab> pumvisible() ? "\<UP>" : "\<S-Tab>"
" in Windows, not works well.
" inoremap <expr> <CR>    pumvisible() ? "\<C-y>" : "\<CR>"
if !has('win32') && !has('win64')
    " Linuxでも意図しない挙動を起こす可能性があるので注意する
    inoremap <expr> <CR>    pumvisible() ? "\<C-y>" : "\<CR>"
endif
