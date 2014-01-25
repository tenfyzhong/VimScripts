" quickfix
if !exists('QUICKFIX_VIMRC')
let QUICKFIX_VIMRC = 1

if has ("quickfix")
	call g:echo_plugin_message('quickfix', 1)

	nnoremap <silent><leader>qk <esc>:cprevious<cr>
	nnoremap <silent><leader>qj <esc>:cnext<cr>
	nnoremap <silent><leader>qc <esc>:cclose<cr>
	nnoremap <silent><leader>qo <esc>:copen<cr>
else
	call g:echo_plugin_message('quickfix', 0)
endif


endif
