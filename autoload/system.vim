"==============================================================
"    file: system.vim
"   brief: 
" VIM Version: 7.4
"  author: tenfyzhong
"   email: 364755805@qq.com
" created: 2016-01-03 13:15:16
"==============================================================

" system#IsMswin() 判断是否是windows {{{ 
function! system#IsMswin()
    return has("win16") || has("win32")   || has("win64") || has("win95")
endfunction
" }}}


" system#IsUnis() 判断是否是Unix {{{
function! system#IsUnix()
    return has("unix")  || has("macunix") || has("win32unix")
endfunction
" }}} 
