" minibufexpl.vim
PluginAdd 'fholgado/minibufexpl.vim'


let g:miniBufExplAutoStart      = 1
let g:miniBufExplBuffersNeeded 	= 1
let g:miniBufExplCycleArround 	= 1
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplMaxSize 		= 1
let g:miniBufExplHideWhenDiff   = 1
let g:miniBufExplForceSyntaxEnable = 1  

if !exists("g:minibufexpl_map")
    let g:minibufexpl_map = 1
    nnoremap <unique> <silent> <Leader>mt 	:MBEToggle<cr>
    nnoremap <unique> <silent> <Leader>mf   :MBEFocus<cr>
    nnoremap <unique> <silent> <c-h>		<esc>:w<esc>:MBEbp<cr>
    nnoremap <unique> <silent> <c-l> 		<esc>:w<esc>:MBEbn<cr>
endif
