"**********************************************************************
Bundle 'fholgado/minibufexpl.vim'
if g:plugin_exist("minibufexpl.vim")
	let g:miniBufExplorerAutoStart 	= 1
	let g:miniBufExplBuffersNeeded 	= 1
	let g:miniBufExplCycleArround 	= 1
	let g:miniBufExplUseSingleClick = 1

	nnoremap <Leader>mbo 	:MBEOpen<cr>
	nnoremap <Leader>mbc 	:MBEClose<cr>
	nnoremap <Leader>mbt 	:MBEToggle<cr>
	nnoremap <c-k> 			:MBEbn<cr>
	nnoremap <c-j> 			:MBEbp<cr>
endif
"**********************************************************************
