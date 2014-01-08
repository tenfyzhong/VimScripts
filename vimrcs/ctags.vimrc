"**********************************************************************
" ctags
if executable('ctags')
	" echom "ctags plugin"
	set tags=tags
	nmap <silent><leader>tg :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q<cr>
else
	if g:load_vimrc_warn 
		echo "no ctags"
	endif
endif
"**********************************************************************

