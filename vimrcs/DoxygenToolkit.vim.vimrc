" DoxygenToolkit.vim
if !exists('DOXYGENTOOLKIT_VIM_VIMRC')
let DOXYGENTOOLKIT_VIM_VIMRC = 1

let g:load_doxygen_syntax 					= 1
let g:doxygen_enhanced_color	 			= 1
let g:DoxygenToolkit_briefTag_funcName 		= "yes"
let g:DoxygenToolkit_authorName 			= "钟腾辉"

nnoremap <silent><leader>dox <esc>:Dox<cr>
inoremap <silent><leader>dox <esc>:Dox<cr>
nnoremap <silent><leader>doa <esc>:DoxAuthor<cr>
inoremap <silent><leader>doa <esc>:DoxAuthor<cr>
nnoremap <silent><leader>dol <esc>:DoxLic<cr>
inoremap <silent><leader>dol <esc>:DoxLic<cr>

endif
