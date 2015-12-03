" vundle

" let Vundle manage Vundle
PluginAdd 'VundleVim/Vundle.vim'

if !exists("g:Vundle_vim_maps")
    let g:Vundle_vim_maps = 1
    nnoremap <silent><leader>bi :BundleInstall<cr>
endif

