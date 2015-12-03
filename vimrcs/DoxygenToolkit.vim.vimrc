" DoxygenToolkit.vim
PluginAdd 'vim-scripts/DoxygenToolkit.vim'

let g:load_doxygen_syntax 					= 1
let g:doxygen_enhanced_color	 			= 1
let g:DoxygenToolkit_briefTag_funcName 		= "yes"
let g:DoxygenToolkit_authorName 			= "tenfyzhong"

if !exists("g:DoxygenToolkit_vim_maps")
    let g:DoxygenToolkit_vim_maps = 1
    nnoremap <unique><silent><leader>dx <esc>:Dox<cr>
    inoremap <unique><silent><leader>dx <esc>:Dox<cr>
    nnoremap <unique><silent><leader>da <esc>:DoxAuthor<cr>
    inoremap <unique><silent><leader>da <esc>:DoxAuthor<cr>
    nnoremap <unique><silent><leader>dl <esc>:DoxLic<cr>
    inoremap <unique><silent><leader>dl <esc>:DoxLic<cr>
endif
