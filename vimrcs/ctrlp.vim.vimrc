" ctrlp.vim
let g:ctrlp_by_filename 		= 1
let g:ctrlp_working_path_mode 	= 'ra'
let g:ctrlp_match_window 		= 'bottom,order:btt,min:1,max:10,results:10'
let g:ctrlp_custom_ignore 		= {
		\ 'dir':  '\v[\/]\.(git|hg|svn)$',
		\ 'file': '\v\.(exe|so|dll)$',
		\ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
	 	\ }
