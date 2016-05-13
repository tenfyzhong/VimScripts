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
        if filereadable (a:path . a:filename)
            return a:path
        else
            return ''
        endif
    endif

    let l:wholeFileName = a:path . '/' . a:filename
    if filereadable (l:wholeFileName) || isdirectory(l:wholeFileName)
        return fnamemodify(a:path , ':p')
    else
        let l:parent = fnamemodify(a:path, ":p:h:h")
        return <SID>FindFileAbsolutePath(l:parent, a:filename)
    endif
endfunction
" }}}


" 重连cscope.out {{{
function! file#RefreshCscope(autoconnect)
    if a:autoconnect && exists("g:cscope_has_connect")
        return
    endif

    let g:cscope_has_connect = 1

	set nocsverb
    cs kill -1
    let p = file#FindFile(getcwd(), 'cscope.out')
    if p != ''
        execute "cs add " . p . "/cscope.out " . p
    endif
	set csverb
    if !a:autoconnect
        echo "refresh " . p . "/cscope.out success"
    endif
endfunction
" }}}


" 对file文件进行cmd命令 {{{
function! file#ExecFile(cmd, file)
    let l:file_expand = expand(a:file)
    if filereadable(l:file_expand)
        exec a:cmd . ' ' . l:file_expand
        return 1
    endif
    return 0
endfunction
" }}}

" 对file的目录执行cmd动作，如果file是目录，则直接执行 {{{
function! file#ExecFilePath(cmd, file)
    let l:file_expand = expand(a:file)
    if isdirectory(l:file_expand)
        exec a:cmd . ' ' . l:file_expand
        return l:file_expand
    elseif filereadable(l:file_expand)
        let l:file_path = fnamemodify(l:file_expand, ":p:h")
        exec a:cmd . ' ' . l:file_path
        return l:file_path
    endif
    return ''
endfunction
" }}}

" 从当前目录去查找项目根目录 {{{
function! file#GuessProjectRoot(...)
    if a:0
        let l:pwd = a:1
    else
        let l:pwd = getcwd()
    endif
    let l:root_file_flag = [".git", ".svn", ".hg", "README.mk", "Rakefile", "pom.xml"]
    for flag in l:root_file_flag
        let path = file#FindFile(l:pwd, flag)
        if path != ''
            return path
        endif
    endfor
    return ''
endfunction
" }}}

