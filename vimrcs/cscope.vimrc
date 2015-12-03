"  cscope

if has ("cscope")
	set cscopetag " 使支持用Ctrl+]和Ctrl+t 快捷键在代码间跳来跳去
	set csto=1
	set cst

	set nocsverb
    let p = file#FindFile(getcwd(), 'cscope.out')
    if p != ''
        execute "cs add " . p . "/cscope.out " . p
    endif
	set csverb

    if !exists("g:cscope_maps")
        let g:cscope_maps = 1
        nnoremap <unique><C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
        nnoremap <unique><C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
        nnoremap <unique><C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
        nnoremap <unique><C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
        nnoremap <unique><C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
        nnoremap <unique><C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
        nnoremap <unique><C-\>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
        nnoremap <unique><C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

        nnoremap <unique><C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>
        nnoremap <unique><C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>
        nnoremap <unique><C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>
        nnoremap <unique><C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>
        nnoremap <unique><C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>
        nnoremap <unique><C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
        nnoremap <unique><C-@>i :scs find i <C-R>=expand("<cfile>")<CR><CR>
        nnoremap <unique><C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>

        nnoremap <unique><C-@><C-@>s /:vert scs find s <C-R>=expand("<cword>")<CR><CR>
        nnoremap <unique><C-@><C-@>g /:vert scs find g <C-R>=expand("<cword>")<CR><CR>
        nnoremap <unique><C-@><C-@>c /:vert scs find c <C-R>=expand("<cword>")<CR><CR>
        nnoremap <unique><C-@><C-@>t /:vert scs find t <C-R>=expand("<cword>")<CR><CR>
        nnoremap <unique><C-@><C-@>e /:vert scs find e <C-R>=expand("<cword>")<CR><CR>
        nnoremap <unique><C-@><C-@>f /:vert scs find f <C-R>=expand("<cfile>")<CR><CR>
        nnoremap <unique><C-@><C-@>i /:vert scs find i <C-R>=expand("<cfile>")<CR><CR>
        nnoremap <unique><C-@><C-@>d /:vert scs find d <C-R>=expand("<cword>")<CR><CR>
    endif

endif

