" ctags

if executable('ctags')
	set tags=tags
	nnoremap <silent><leader>tg :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q<cr>
endif

