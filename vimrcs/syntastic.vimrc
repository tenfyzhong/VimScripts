"**********************************************************************
Bundle 'scrooloose/syntastic'
if g:plugin_exist("syntastic")
	nnoremap <leader>gc :!~/.vim/bin/generate_clang_complete.sh<cr> 
endif
"**********************************************************************
