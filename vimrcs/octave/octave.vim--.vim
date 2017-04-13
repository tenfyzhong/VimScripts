"==============================================================
"    file: octave.vim--.vimrc
"   brief: 
" VIM Version: 7.4
"  author: tenfyzhong
"   email: 364755805@qq.com
" created: 2017-02-10 19:41:34
"==============================================================
PluginAdd 'vim-scripts/octave.vim--'

augroup octave_init
    autocmd!
    autocmd BufRead,BufNewFile *.m,*.oct setfiletype octave
augroup END
