"**********************************************************************
Bundle 'vim-scripts/minibufexplorerpp'
if g:plugin_exist("minibufexplorerpp")
	" echom "minibufexploerepp plugin"
	let g:miniBufExplMapCTabSwitchBufs=1
	let g:miniBufExplMapWindowNavArrows=1
	let g:miniBufExplMapWindowNavVim=1
else
	if g:load_vimrc_warn 
		echo "no minibufexplorerpp"
	endif
endif
"**********************************************************************
