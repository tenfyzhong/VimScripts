" minibufexpl.vim
PluginAdd 'fholgado/minibufexpl.vim'


let g:miniBufExplorerAutoStart 	= 1
let g:miniBufExplBuffersNeeded 	= 1
let g:miniBufExplCycleArround 	= 1
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplMaxSize 		= 1

nnoremap <silent><Leader>mo 	:MBEOpen<cr>
nnoremap <silent><Leader>mc 	:MBEClose<cr>
nnoremap <silent><Leader>mt 	:MBEToggle<cr>
nnoremap <silent><Leader>mf     :MBEFocus<cr>
nnoremap <silent><Leader>mk 	<esc>:w<esc>:MBEbn<cr>
nnoremap <silent><Leader>mj 	<esc>:w<esc>:MBEbp<cr>
nnoremap <silent><c-h>			<esc>:w<esc>:MBEbp<cr>
nnoremap <silent><c-l> 			<esc>:w<esc>:MBEbn<cr>
