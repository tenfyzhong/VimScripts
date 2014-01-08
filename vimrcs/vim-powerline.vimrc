"**********************************************************************
Bundle 'Lokaltog/vim-powerline'
if g:plugin_exist("vim-powerline")
	"echom "vim-powerline plugin"
	let g:Powerline_symbols = 'fancy'
else
	if g:load_vimrc_warn 
		echo "no vim-powerline"
	endif
endif
"**********************************************************************
