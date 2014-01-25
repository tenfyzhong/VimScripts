" ctags
if executable('ctags')
	call g:echo_plugin_message('ctags', 1)
	set tags=tags
	nnoremap <silent><leader>tg :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q<cr>
else
	call g:echo_plugin_message('ctags', 0)
endif
