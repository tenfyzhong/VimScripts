" unite.vim
PluginAdd 'Shougo/unite.vim'

let g:unite_source_history_yank_enable = 1
nnoremap <leader>uf :<C-u>Unite file<cr>
nnoremap <leader>ur :<C-u>Unite file_rec/async<cr>
nnoremap <leader>ub :<C-u>Unite buffer<cr>
nnoremap <leader>uy :<C-u>Unite history/yank<CR>
