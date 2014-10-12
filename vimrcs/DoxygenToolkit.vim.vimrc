" DoxygenToolkit.vim
PluginAdd 'vim-scripts/DoxygenToolkit.vim'

let g:load_doxygen_syntax 					= 1
let g:doxygen_enhanced_color	 			= 1
let g:DoxygenToolkit_briefTag_funcName 		= "yes"
let g:DoxygenToolkit_authorName 			= "钟腾辉"

nnoremap <silent><leader>dx <esc>:Dox<cr>
inoremap <silent><leader>dx <esc>:Dox<cr>
nnoremap <silent><leader>da <esc>:DoxAuthor<cr>
inoremap <silent><leader>da <esc>:DoxAuthor<cr>
nnoremap <silent><leader>dl <esc>:DoxLic<cr>
inoremap <silent><leader>dl <esc>:DoxLic<cr>

