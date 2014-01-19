

if has ("quickfix")
	call g:echo_plugin_message('quickfix', 1)

	nnoremap <leader>qk <esc>:cprevious<cr>
	nnoremap <leader>qj <esc>:cnext<cr>
	nnoremap <leader>qc <esc>:cclose<cr>
	nnoremap <leader>qo <esc>:copen<cr>
else
	call g:echo_plugin_message('quickfix', 0)
endif

