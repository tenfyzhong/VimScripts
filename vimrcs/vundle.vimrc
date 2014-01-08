"**********************************************************************
if g:plugin_exist("vundle")
	" echom "vundle plugin"
	set rtp+=~/.vim/bundle/vundle
	call vundle#rc()
	
	" let Vundle manage Vundle
	Bundle 'gmarik/vundle'
	
	nnoremap <leader>bi :BundleInstall<cr>
else
	if g:load_vimrc_warn 
		echo "no vundle"
	endif
endif
"**********************************************************************
