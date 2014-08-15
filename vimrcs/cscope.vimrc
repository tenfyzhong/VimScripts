" cscope

if has ("cscope")
	call EchoPluginMessage("cscope", 1)
	set cscopetag " 使支持用Ctrl+]和Ctrl+t 快捷键在代码间跳来跳去
	set csto=0
	set cst

	set nocsverb
	if filereadable ("cscope.out")
		cs add cscope.out
	elseif $CSCOPE_DB_PATH != ""
    	cs add ${CSCOPE_DB_PATH}/cscope.out $CSCOPE_DB_PATH
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

else
	call EchoPluginMessage("cscope", 0)
endif

