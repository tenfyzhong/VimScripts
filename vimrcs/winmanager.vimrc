"**********************************************************************
Bundle 'winmanager'
if g:plugin_exist("winmanager")
	" echom "winmanager plugin"
	let g:winManagerWindowLayout='FileExplorer|TagList'
	let g:persitentBehaviour=0
	let g:winManagerWidth=20
	let g:defaultExplorer=1
	nmap <silent><leader>wm :WMToggle<cr>
else
	if g:load_vimrc_warn 
		echo "no winmanager"
	endif
endif
"**********************************************************************
