" ctags

if executable('ctags')
	call EchoPluginMessage('ctags', 1)
	set tags=tags
	nnoremap <silent><leader>tg :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q<cr>
else
	call EchoPluginMessage('ctags', 0)
endif

