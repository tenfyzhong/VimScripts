"**********************************************************************
Bundle 'FindMate'
if g:plugin_exist("FindMate")
	" echom "FindMate plugin"
	let g:FindMate_verbose = 'locate'
else
	if g:load_vimrc_warn 
		echo "no FindMate"
	endif
endif
"**********************************************************************
