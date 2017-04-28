"==============================================================
"    file: feature.vim
"   brief: 
" VIM Version: 7.4
"  author: tenfyzhong
"   email: tenfyzhong@qq.com
" created: 2016-07-10 17:45:11
"==============================================================


function! feature#PollNumber() "{{{ 行号相对行号间切换
    let g:number_mode = &number * 2 + &relativenumber 
    " g:number_mode 
    " 3为开启行号和相对行号
    " 2为开启行号
    " 1为开启相对行号
    " 0为关闭所有
    " 为3, (2|1), 0
    if g:number_mode == 3   
        set norelativenumber
        set number
    elseif g:number_mode == 2 || 
                \g:number_mode == 1
        set nonumber
        set norelativenumber
    else
        set number
        set relativenumber
    endif
endfunction "}}}

function! feature#quickfixDo(cmd) "{{{ quickfix和location兼容性的命令
    let l:prefix = ''
    if len(getloclist(0)) > 0
        let l:prefix = 'l'
    else
        let l:prefix = 'c'
    endif
    if a:cmd == 'open'
        let l:cmd = 'silent botright ' . l:prefix . a:cmd 
    else
        let l:cmd = 'silent ' . l:prefix . a:cmd 
    endif
    try
        exec l:cmd
    catch /^Vim\%((\a\+)\)\=:E553/
        echo 'No more items'
    endtry
endfunction "}}}

