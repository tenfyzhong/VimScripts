" unite.vim
PluginAdd 'Shougo/unite.vim'

let g:unite_source_history_yank_enable = 1

if !exists("g:unite_vim_maps")
    let g:unite_vim_maps = 1
    " nnoremap <unique><silent><leader>uf :<C-u>Unite file<cr>
    " nnoremap <unique><silent><leader>ur :<C-u>Unite file_rec/async<cr>
    " nnoremap <unique><silent><leader>ub :<C-u>Unite buffer<cr>
    " nnoremap <unique><silent><leader>uy :<C-u>Unite history/yank<CR>
endif
