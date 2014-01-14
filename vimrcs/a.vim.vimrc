"**********************************************************************
Bundle 'a.vim'
if g:plugin_exist("a.vim")
	"echom "a.vim plugin"
	nnoremap <leader>as :A<cr>
else
	if g:load_vimrc_warn 
		echo "no a.vim"
	endif
endif
"**********************************************************************
