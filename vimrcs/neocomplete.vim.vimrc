"==============================================================
"    file: neocomplete.vim.vimrc
"   brief: 
" VIM Version: 7.4
"  author: tenfyzhong
"   email: 364755805@qq.com
" created: 2016-08-15 00:01:39
"==============================================================
PluginAdd 'Shougo/neocomplete.vim'
PluginAdd 'Shougo/neopairs.vim'

let g:neopairs#enable = 1

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#auto_completion_start_length = 1
let g:neocomplete#min_keyword_length = 2
let g:neocomplete#auto_complete_delay = 0
let g:neocomplete#enable_refresh_always = 1

inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif
" let g:neocomplete#sources#omni#input_patterns.python = ''
" let g:neocomplete#sources#omni#input_patterns.ruby = ''

augroup neocomplete_setting
    au!
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
	autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
	autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
	autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
	autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
	autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup END

