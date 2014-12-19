"  cscope
"  查找当前目录到父目录中的cscope.out
function! FindCscopePath(path)
    if a:path == '/'
        return ''
    endif

    if filereadable (a:path . '/cscope.out')
        return a:path 
    else
        let id = strridx(a:path, '/')
        if id > 0 && a:path[id] == '/'
            let id = id - 1
        endif
        return FindCscopePath(a:path[0:id])
    endif

endfunction

if has ("cscope")
	set cscopetag " 使支持用Ctrl+]和Ctrl+t 快捷键在代码间跳来跳去
	set csto=0
	set cst

	set nocsverb
    let p = FindCscopePath(getcwd())
    if p != ''
        execute "cs add " . p . "/cscope.out " . p
    endif
	set csverb

	nnoremap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
	nnoremap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
	nnoremap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
	nnoremap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
	nnoremap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
	nnoremap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
	nnoremap <C-\>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
	nnoremap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

	nnoremap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>
	nnoremap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>
	nnoremap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>
	nnoremap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>
	nnoremap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>
	nnoremap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
	nnoremap <C-@>i :scs find i <C-R>=expand("<cfile>")<CR><CR>
	nnoremap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>

	nnoremap <C-@><C-@>s /:vert scs find s <C-R>=expand("<cword>")<CR><CR>
	nnoremap <C-@><C-@>g /:vert scs find g <C-R>=expand("<cword>")<CR><CR>
	nnoremap <C-@><C-@>c /:vert scs find c <C-R>=expand("<cword>")<CR><CR>
	nnoremap <C-@><C-@>t /:vert scs find t <C-R>=expand("<cword>")<CR><CR>
	nnoremap <C-@><C-@>e /:vert scs find e <C-R>=expand("<cword>")<CR><CR>
	nnoremap <C-@><C-@>f /:vert scs find f <C-R>=expand("<cfile>")<CR><CR>
	nnoremap <C-@><C-@>i /:vert scs find i <C-R>=expand("<cfile>")<CR><CR>
	nnoremap <C-@><C-@>d /:vert scs find d <C-R>=expand("<cword>")<CR><CR>

endif

