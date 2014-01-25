" vundle
if !exists('VUNDLE_VIMRC')
let VUNDLE_VIMRC = 1

if g:plugin_exist("vundle")
	set rtp+=~/.vim/bundle/vundle
	call vundle#rc()
	
	" let Vundle manage Vundle
	Bundle 'gmarik/vundle'
	
	nnoremap <silent><leader>bi :BundleInstall<cr>
endif

endif
