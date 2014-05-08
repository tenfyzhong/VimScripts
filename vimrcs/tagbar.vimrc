" tagbar

" 比taglist更现代的代码结构浏览工具
function! TagbarStatusFunc(current, sort, fname, ...) abort
	let colour = a:current ? '%#StatusLine#' : '%#StatusLineNC#'
	return colour . '[' . a:sort . '] ' . a:fname
endfunction

nnoremap <silent><leader>tt :TagbarToggle<CR>
nnoremap <silent><leader>ta :NERDTreeToggle<cr><c-w>l:TagbarToggle<CR><c-w>j
" autocmd FileType c,cpp,h,cc,hpp,cxx nested :TagbarOpen

let g:tagbar_width 				= 25
let g:tagbar_compact 			= 1
let g:tagbar_show_linenumbers 	= 1
let g:tagbar_status_func 		= 'TagbarStatusFunc'
let g:tagbar_show_visibility 	= 1
let g:tagbar_iconchars 			= ['▸', '▾']

