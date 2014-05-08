" vundle

if g:plugin_exist("vundle")
	set rtp+=~/.vim/bundle/vundle
	call vundle#rc()
	
	" let Vundle manage Vundle
	Bundle 'gmarik/vundle'
	
	nnoremap <silent><leader>bi :BundleInstall<cr>
endif

