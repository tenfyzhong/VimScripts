"**********************************************************************
Bundle 'ervandew/supertab'
if g:plugin_exist("supertab")
	" echom "supertab plugin"
	"let g:SuperTabDefaultCompletionType = "context"
	let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
else
	if g:load_vimrc_warn 
		echo "no supertab"
	endif
endif
"**********************************************************************
