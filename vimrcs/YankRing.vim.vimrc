PluginAdd 'tenfyzhong/YankRing.vim'

let g:yankring_history_file = '.yankring_history'

let g:yankring_replace_n_pkey = '<C-J>'
let g:yankring_replace_n_nkey = '<C-K>'

if !exists("g:yankring_init")
    nnoremap <unique><silent><leader>yr :YRShow
endif

let g:yankring_init = 1
