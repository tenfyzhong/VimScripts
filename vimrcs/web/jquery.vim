"==============================================================
"    file: jquery.vim
"   brief: jquery语法高亮
" VIM Version: 7.4
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2016-04-14 14:09:13
"==============================================================
Plug 'nono/jquery.vim', {'for': 'javascript'}

augroup JQUERY
    autocmd!
    au BufRead,BufNewFile jquery.js,jquery.*.js set ft=javascript syntax=jquery
augroup END
