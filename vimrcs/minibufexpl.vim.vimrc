"**********************************************************************
Bundle 'fholgado/minibufexpl.vim'
if g:plugin_exist("minibufexpl.vim")
	" echom "minibufexpl plugin"
	let g:miniBufExplorerAutoStart 	= 1
	let g:miniBufExplBuffersNeeded 	= 1
	let g:miniBufExplCycleArround 	= 1
	let g:miniBufExplUseSingleClick = 1

	nnoremap <Leader>mbe :MBEOpen<cr>
	nnoremap <Leader>mbc :MBEClose<cr>
	nnoremap <Leader>mbt :MBEToggle<cr>
else
	if g:load_vimrc_warn 
		echo "no minibufexpl"
	endif
endif
"**********************************************************************
