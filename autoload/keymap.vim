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
    if !empty(a:key)
        exec "set <m-" . a:key . ">=\<esc>" . a:key
    endif
endfunction "}}}

" {{{ alt键需要使用这个函数来做映射
function! keymap#Mate(action)
    let l:key = substitute(a:action, "\\c.*<m-\\(\\w\\)>.*", "\\l\\1", "")
    call keymap#EnableMateKey(l:key)
    if !empty(a:action)
        exec a:action
    endif
endfunction
" }}}
