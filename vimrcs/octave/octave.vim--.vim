"==============================================================
"    file: octave.vim--.vimrc
"   brief: 
" VIM Version: 7.4
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2017-02-10 19:41:34
"==============================================================
PluginAdd 'vim-scripts/octave.vim--', {'for': 'octave'}

augroup octave_init
    autocmd!
    autocmd BufRead,BufNewFile *.m,*.oct setfiletype octave
augroup END
