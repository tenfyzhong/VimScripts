"**********************************************************************
Bundle 'Valloric/YouCompleteMe'
if g:plugin_exist("YouCompleteMe")
	"echom "YouCompleteMe plugin"
	let g:ycm_min_num_of_chars_for_completion = 1
	let g:ycm_add_preview_to_completeopt = 1
	let g:ycm_autoclose_preview_window_after_insertion = 1
else
	if g:load_vimrc_warn 
		echo "no YouCompleteMe"
	endif
endif
"**********************************************************************
