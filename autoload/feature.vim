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

function! feature#GetLoclistWinNr() "{{{ 如果loclist已经打开，则返回其winnr，否则返回-1
    return feature#GetQuickfixOrLoclistWinNr()[0]
endfunction "}}}

function! feature#GetQuickfixWinNr() "{{{ 如果quickfix已经打开，则返回其winnr，否则返回-1
    return feature#GetQuickfixOrLoclistWinNr()[1]
endfunction "}}}

function! feature#GetQuickfixOrLoclistWinNr() "{{{ 返回quickfix和loclist的winnr元组，[0]为loclist,[1]为quickfix
    let wininfo = getwininfo()
    " let result = {'quickfix':-1, 'loclist':-1}
    let result = [-1, -1]
    for info in wininfo
        if info['quickfix'] == 1 && info['loclist'] == 1
            " let result['loclist'] = info['winnr']
            let result[0] = info['winnr']
        endif
        if info['quickfix'] == 1 && info['loclist'] == 0
            " let result['quickfix'] = info['winnr']
            let result[1] = info['winnr']
        endif
    endfor
    return result
endfunction "}}}

function! feature#QuickfixOpen() "{{{ 打开quickfix或者loclist
    if len(getloclist(0)) > 0
        silent botright lopen
    else
        silent botright copen
    endif
endfunction "}}}

function! feature#QuickfixDo(cmd) "{{{ quickfix和location兼容性的命令
    let quickfix_info = feature#GetQuickfixOrLoclistWinNr()
    let prefix = 'l'

    if quickfix_info[0] != -1
        let prefix = 'l'
    elseif quickfix_info[1] != -1
        let prefix = 'c'
    else
        echo 'No quickfix or loclist window'
        return
    endif

    try
        exec 'silent ' . prefix . a:cmd
    catch /^Vim\%((\a\+)\)\=:E553/
        echo 'No more items'
    endtry
endfunction "}}}

function! feature#toggle_xxd() "{{{
    if !exists('b:is_xxd')
        let b:is_xxd = 0
    endif
    let modified = &modified
    if b:is_xxd
        set nobinary
        silent %!xxd -r
        let b:is_xxd = 0
    else
        set binary
        silent %!xxd
        let b:is_xxd = 1
    endif
    if modified
        set modified
    else
        set nomodified
    endif
endfunction "}}}

function! feature#exec_list(...) "{{{ 执行所有的命令，没有返回值
    for cmd in a:000
        if empty(cmd)
            continue
        endif
        exec cmd
    endfor
endfunction "}}}
