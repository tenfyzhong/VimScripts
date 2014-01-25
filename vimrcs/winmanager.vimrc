" winmanager

"let g:winManagerWindowLayout = 'FileExplorer,TagsExplorer|BufExplorer'
let g:persitentBehaviour 		= 0
let g:winManagerWidth 			= 25
let g:defaultExplorer 			= 1

let g:NERDTree_title 			= '[NERD Tree]'

let g:winManagerWindowLayout 	= 'NERDTree|TagList'

function! NERDTree_Start()
   exec 'NERDTree'
endfunction

function! NERDTree_IsValid()
   return 1
endfunction

"let loaded_winmanager 	= 1
nnoremap <silent><leader>wm :WMToggle<cr>
