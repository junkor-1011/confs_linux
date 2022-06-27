
" setting for python
let g:lsp_settings_filetype_python = ['pyls', 'pyls-all', 'jedi-language-server']

" setting for js, jsx, ts, tsx
let g:lsp_settings_filetype_javascript = ['eslint-language-server', 'typescript-language-server']
let g:lsp_settings_filetype_javascriptreact = ['eslint-language-server', 'typescript-language-server']
let g:lsp_settings_filetype_typescript = ['typescript-language-server', 'eslint-language-server']
let g:lsp_settings_filetype_typescriptreact = ['typescript-language-server', 'eslint-language-server']

let g:lsp_settings = {'typescript-language-server':{'whitelist': ['typescript', 'typescriptreact']}}
let g:lsp_settings = {
\ 'efm-langserver': {
\ 'disabled': v:false
\}
\}
