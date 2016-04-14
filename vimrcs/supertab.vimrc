"==============================================================
"    file: supertab.vimrc
"   brief: 使用tab键来进行补全
" VIM Version: 7.4
"  author: tenfyzhong
"   email: 364755805@qq.com
" created: 2016-04-14 20:25:57
"==============================================================
if !exists("g:use_supertab") || g:use_supertab == 0 || version < 700
    finish
end

PluginAdd 'ervandew/supertab'

let g:SuperTabDefaultCompletionType 	= "context"
"let g:SuperTabDefaultCompletionType 	= "<c-x><c-o>"

autocmd FileType *
  \ if &omnifunc != '' |
  \   call SuperTabChain(&omnifunc, "<c-p>") |
  \   call SuperTabSetDefaultCompletionType("<c-x><c-u>") |
  \ endif

