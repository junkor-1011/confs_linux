nmap <silent> <Leader>a :ALEToggle<CR>

function! s:ale_list()
    let g:ale_open_list = 1
    call ale#Queue(0, 'lint_file')
endfunction
command! ALEList call s:ale_list()
nnoremap <Leader>m  :ALEList<CR>
" autocmd MyAutoGroup FileType qf nnoremap <silent> <buffer> q :let g:ale_open_list = 0<CR>:q!<CR>
" autocmd MyAutoGroup FileType help,qf,man,ref let b:ale_enabled = 0

" language setting -----------------------

" Python
let g:ale_linters = {
    \ 'python': ['flake8', 'pylint', 'mypy'],
    \ }

let g:ale_fixers = {
    \ 'python': ['autopep8', 'black', 'isort', 'yapf'],
    \ }

" let g:ale_python_flake8_executable = g:python3_host_prog
let g:ale_python_flake8_options = '-m flake8'
" let g:ale_python_autopep8_executable = g:python3_host_prog
let g:ale_python_autopep8_options = '-m autopep8'
" let g:ale_python_isort_executable = g:python3_host_prog
let g:ale_python_isort_options = '-m isort'
" let g:ale_python_black_executable = g:python3_host_prog
let g:ale_python_black_options = '-m black'
