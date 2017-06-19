"==============================================================
"    file: system.vim
"   brief: 
" VIM Version: 7.4
"  author: tenfyzhong
"   email: tenfyzhong@qq.com
" created: 2016-01-03 13:15:16
"==============================================================


" system#IsMswin() 判断是否是windows {{{ 
let s:is_mswin = has("win16") || has("win32")   || has("win64") || has("win95")
function! system#IsMswin()
    return s:is_mswin
endfunction
" }}}


" system#IsUnis() 判断是否是Unix {{{
let s:is_unix = has("unix")  || has("macunix") || has("win32unix")
function! system#IsUnix()
    return s:is_unix
endfunction
" }}} 

" system#IsUnixInMswin() 判断是否是寄生在windows上的unix {{{
let s:is_unix_in_mswin = has("win32unix")
function! system#IsUnixInMswin()
    return s:is_unix_in_mswin
endfunction
" }}}

" 判断是不是nvim
let s:nvim = has('nvim')
function! system#nvim() "{{{
    return s:nvim
endfunction "}}}

let s:version = version
function! system#version() "{{{
    return s:version
endfunction "}}}
