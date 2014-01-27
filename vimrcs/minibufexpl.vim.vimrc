" minibufexpl.vim
if !exists('MINIBUFEXPL_VIM_VIMRC')
let MINIBUFEXPL_VIM_VIMRC = 1

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
nnoremap <silent><c-h>			<esc>:w<esc>:MBEbp<cr>
nnoremap <silent><c-l> 			<esc>:w<esc>:MBEbn<cr>
inoremap <silent><c-h>			<esc>:w<esc>:MBEbp<cr>
inoremap <silent><c-l> 			<esc>:w<esc>:MBEbn<cr>

endif
