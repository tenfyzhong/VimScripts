" vundle

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" let Vundle manage Vundle
PluginAdd 'VundleVim/Vundle.vim'

nnoremap <silent><leader>bi :BundleInstall<cr>

