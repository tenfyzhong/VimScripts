"==============================================================
"    file: keymap.vim
"   brief: 
" VIM Version: 7.4
"  author: tenfyzhong
"   email: 364755805@qq.com
" created: 2016-04-07 10:05:56
"==============================================================

"{{{ 激活m-[key]的组合键
function! keymap#EnableMateKey(key) 
    if system#IsUnix() && !system#IsUnixInMswin() && !has('gui_running') && !empty(a:key)
        exec "set <m-" . a:key . ">=\<esc>" . a:key
        return 1
    endif
    return 0
endfunction "}}}

" {{{ alt键需要使用这个函数来做映射
function! keymap#Mate(action)
    let l:key = substitute(a:action, "\\c.*<m-\\(\\S\\)>.*", "\\l\\1", "")
    let l:result = keymap#EnableMateKey(l:key)
    if l:result && !empty(a:action)
        exec a:action
    endif
endfunction
" }}}
