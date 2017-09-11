"==============================================================
"    file: string.vim
"   brief: 
" VIM Version: 7.4
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2016-06-15 22:32:37
"==============================================================

function! string#ToCamel(content)
    let items = split(a:content, '_')
    let result = ''
    for item in items
        let upperFirst = substitute(item, '.', '\u&', '')
        let result = result . upperFirst
    endfor
    return result
endfunction
