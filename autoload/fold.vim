"==============================================================
"    file: fold.vim
"   brief: 折叠相关的函数
" VIM Version: 7.4
"  author: tenfyzhong
"   email: 364755805@qq.com
" created: 2015-11-30 20:03:11
"==============================================================


" 大括号折叠的表达式函数
" 左大括号为开折叠，右大括号为关折叠 {{{
function! fold#BraceFoldExpr(lnum)
    let l:content = getline(a:lnum)
    if l:content =~ "{"
        return ">" . ((indent(a:lnum)+&shiftwidth-1) / &shiftwidth + 1)
    elseif l:content =~ "}"
        return "<" . ((indent(a:lnum)+&shiftwidth-1) / &shiftwidth + 1)
    else
        return "="
    endif
    return -1
endfunction
" }}}
