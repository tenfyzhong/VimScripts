" unite.vim
PluginAdd 'Shougo/unite.vim'

let g:unite_source_history_yank_enable = 1

if !exists("g:unite_vim_maps")
    let g:unite_vim_maps = 1
    " nnoremap <silent><leader>uf :<C-u>Unite file<cr>
    " nnoremap <silent><leader>ur :<C-u>Unite file_rec/async<cr>
    " nnoremap <silent><leader>ub :<C-u>Unite buffer<cr>
    " nnoremap <silent><leader>uy :<C-u>Unite history/yank<CR>
endif
