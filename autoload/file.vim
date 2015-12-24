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
    let l:isRoot = 0
    if g:MSWIN
        let l:isRoot = a:path =~ '^\w:\\$'
    else
        let l:isRoot = a:path == '/'
    endif

    if l:isRoot
        if filereadable (a:path . '/' . a:filename)
            return a:path
        else
            return ''
        endif
    endif

    if filereadable (a:path . '/' . a:filename)
        return a:path 
    else
        let l:parent = fnamemodify(a:path, ":p:h:h")
        return <SID>FindFileAbsolutePath(l:parent, a:filename)
    endif
endfunction
" }}}


" 重连cscope.out {{{
function! file#RefreshCscope(alter)
	set nocsverb
    cs kill -1
    let p = file#FindFile(getcwd(), 'cscope.out')
    if p != ''
        execute "cs add " . p . "/cscope.out " . p
    endif
	set csverb
    if a:alter
        echo "refresh " . p . "/cscope.out success"
    endif
endfunction
" }}}
