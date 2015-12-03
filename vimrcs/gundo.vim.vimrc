" gundo.vim
PluginAdd 'sjl/gundo.vim'

let g:gundo_right = 1

if !exists("g:gundo_vim_maps")
    let g:gundo_vim_maps = 1
    nnoremap <unique><silent><leader>gu <esc>:GundoToggle<cr>
endif

