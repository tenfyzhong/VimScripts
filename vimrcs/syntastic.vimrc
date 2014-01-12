"**********************************************************************
Bundle 'scrooloose/syntastic'
if g:plugin_exist("syntastic")
	"echom "syntastic plugin"
	nnoremap <leader>gc :!~/.vim/bin/generate_clang_complete.sh<cr> 
else
	if g:load_vimrc_warn 
		echo "no syntastic"
	endif
endif
"**********************************************************************
