" 从path目录开始向上查找filename，找到则返回对应的path ----------------------{{{
function! file#FindFile(path, filename)
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
        return file#FindFile(a:path[0:id], a:filename)
    endif
endfunction
" }}} --------------------------------------------------------------------------

