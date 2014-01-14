"**********************************************************************
" cscope
if has ("cscope")
	call g:echo_plugin_message("cscope", 1)
	set cscopetag " 使支持用Ctrl+]和Ctrl+t 快捷键在代码间跳来跳去
	set csto=0
	set cst

	set nocsverb
	if filereadable ("cscope.out")
		cs add cscope.out
	elseif $CSCOPE_DB != ""
		cs add $CSCOPE_DB
	endif
	set csverb

	nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-_>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>

	nmap <C-Space>s :scs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space>g :scs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space>c :scs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space>t :scs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space>e :scs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-Space>i :scs find i <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-Space>d :scs find d <C-R>=expand("<cword>")<CR><CR>

	nmap <C-Space><C-Space>s /:vert scs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space><C-Space>g /:vert scs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space><C-Space>c /:vert scs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space><C-Space>t /:vert scs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space><C-Space>e /:vert scs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space><C-Space>i /:vert scs find i <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-Space><C-Space>d /:vert scs find d <C-R>=expand("<cword>")<CR><CR>

else
	call g:echo_plugin_message("cscope", 0)
endif
"**********************************************************************
