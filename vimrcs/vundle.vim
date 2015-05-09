" vundle

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" let Vundle manage Vundle
PluginAdd 'gmarik/vundle'

nnoremap <silent><leader>bi :BundleInstall<cr>

