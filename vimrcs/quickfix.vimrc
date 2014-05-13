" quickfix

if has ("quickfix")
	call EchoPluginMessage('quickfix', 1)

	nnoremap <silent><leader>qk <esc>:cprevious<cr>
	nnoremap <silent><leader>qj <esc>:cnext<cr>
	nnoremap <silent><leader>qc <esc>:cclose<cr>
	nnoremap <silent><leader>qo <esc>:copen<cr>
else
	call EchoPluginMessage('quickfix', 0)
endif


