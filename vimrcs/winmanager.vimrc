"**********************************************************************
Bundle 'winmanager'
if g:plugin_exist("winmanager")
	" echom "winmanager plugin"
	let g:persitentBehaviour=0
	let g:winManagerWidth=25
	let g:defaultExplorer=1

	"let loaded_winmanager 	= 1
	nnoremap <leader>wm :WMToggle<cr>
else
	if g:load_vimrc_warn 
		echo "no winmanager"
	endif
endif
"**********************************************************************
