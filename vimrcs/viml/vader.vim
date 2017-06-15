PluginAdd 'junegunn/vader.vim'
augroup vader_init
    autocmd!
    autocmd FileType vader set fdm=marker
augroup END
