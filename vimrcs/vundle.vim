" vundle

if PluginExist('vundle')
	set rtp+=~/.vim/bundle/vundle
	call vundle#rc()
	
	" let Vundle manage Vundle
	Bundle 'gmarik/vundle'
	
	nnoremap <silent><leader>bi :BundleInstall<cr>
else
    call Error('vundle no exist')
endif

