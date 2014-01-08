"**********************************************************************
Bundle 'Rip-Rip/clang_complete'
if g:plugin_exist("clang_complete")
	"echom "clang_complete plugin"
	let g:clang_auto_select=1	" 0不选择，1选择第一项，2选择第一项并插入
	let g:clang_trailing_place_holder=1
	let g:clang_complete_copen=1
	let g:clang_periodic_quickfix=1
	let g:clang_snippets=1
	let g:clang_close_preview=1
	let g:clang_use_library=1
	let g:clang_use_options='-stdlib=libc++ -std=c++11'
	nnoremap <leader>gc :!~/.vim/bin/generate_clang_complete.sh<cr> 
else
	if g:load_vimrc_warn 
		echo "no clang_complete"
	endif
endif
"**********************************************************************
