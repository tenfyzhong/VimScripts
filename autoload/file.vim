" 从path目录开始向上查找filename，找到则返回对应的path ----------------------{{{
function! file#FindFile(path, filename)
    let l:absolute_path = fnamemodify(a:path, ':p')
    if !isdirectory(l:absolute_path)
        return ''
    endif
    return <SID>FindFileAbsolutePath(l:absolute_path, a:filename)
endfunction
" }}} --------------------------------------------------------------------------


" 从绝对对路path开始查找filename，辅助函数 {{{
function! s:FindFileAbsolutePath(path, filename)
    if a:path == '/'
        if filereadable (a:path . '/' . a:filename)
            return '/'
        else
            return ''
        endif
    endif

    if filereadable (a:path . '/' . a:filename)
        return a:path 
    else
        let id = strridx(a:path, '/')
        if id > 0 && a:path[id] == '/'
            let id = id - 1
        endif
        return <SID>FindFileAbsolutePath(a:path[0:id], a:filename)
    endif
endfunction
" }}}
