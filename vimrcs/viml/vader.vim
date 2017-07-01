PluginAdd 'junegunn/vader.vim'
augroup vader_init
    autocmd!
    autocmd FileType vader set fdm=marker
    autocmd FileType vader nnoremap <buffer><leader>rf <ESC>:<C-U>Vader<CR>
augroup END
