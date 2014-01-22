"**********************************************************************
"Bundle 'fholgado/minibufexpl.vim'
if g:plugin_exist("minibufexpl.vim")
	let g:miniBufExplorerAutoStart 	= 1
	let g:miniBufExplBuffersNeeded 	= 1
	let g:miniBufExplCycleArround 	= 1
	let g:miniBufExplUseSingleClick = 1
	let g:miniBufExplMaxSize 		= 1

	nnoremap <silent><Leader>mbo 	:MBEOpen<cr>
	nnoremap <silent><Leader>mbc 	:MBEClose<cr>
	nnoremap <silent><Leader>mbt 	:MBEToggle<cr>
	nnoremap <silent><Leader>mbk 	<esc>:w<esc>:MBEbn<cr>
	nnoremap <silent><Leader>mbj 	<esc>:w<esc>:MBEbp<cr>
	nnoremap <silent><c-k> 			<esc>:w<esc>:MBEbn<cr>
	nnoremap <silent><c-s-k>		<esc>:w<esc>:MBEbp<cr>
	inoremap <silent><c-k> 			<esc>:w<esc>:MBEbn<cr>
	inoremap <silent><c-s-k>		<esc>:w<esc>:MBEbp<cr>
endif
"**********************************************************************
