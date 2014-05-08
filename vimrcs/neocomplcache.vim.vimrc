" neocomplcache.vim


" Disable AutoComplPop.
let g:acp_enableAtStartup 						= 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup 			= 1
" Use smartcase.
let g:neocomplcache_enable_smart_case 			= 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length 			= 1
let g:neocomplcache_lock_buffer_name_pattern 	= '\*ku\*'

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

