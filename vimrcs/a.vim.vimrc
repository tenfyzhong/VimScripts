"  a.vim
PluginAdd 'tenfyzhong/a.vim'

let g:alternateNoDefaultAlternate = 1

if !exists("g:a_vim_maps")
    let g:a_vim_maps = 1
    nnoremap <unique><silent><leader>as :A<cr>
endif

