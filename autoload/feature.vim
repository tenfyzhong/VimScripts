"==============================================================
"    file: feature.vim
"   brief: 
" VIM Version: 7.4
"  author: tenfyzhong
"   email: 364755805@qq.com
" created: 2016-07-10 17:45:11
"==============================================================


function! feature#PollNumber() "{{{ 行号相对行号间切换
    let g:number_mode = &number  + &relativenumber 
    " g:number_mode 
    " 2为开启行号和相对行号
    " 1为开启行号
    " 0为关闭所有
    " 每次值减1
    if g:number_mode == 2
        set norelativenumber
    elseif g:number_mode == 1
        set nonumber
    else
        set number
        set relativenumber
    endif
endfunction "}}}