"==============================================================
"    file: vim-javacomplete2.vimrc
"   brief: 
" VIM Version: 7.4
"  author: tenfyzhong
"   email: 364755805@qq.com
" created: 2016-04-08 22:00:50
"==============================================================
PluginAdd 'artur-shaik/vim-javacomplete2'

augroup javacomplete2
    au!
    autocmd FileType java setlocal omnifunc=javacomplete#Complete
augroup END
