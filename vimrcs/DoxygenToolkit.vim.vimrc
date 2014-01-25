" DoxygenToolkit.vim
let g:load_doxygen_syntax 				= 1
let g:doxygen_enhanced_color 			= 1
let g:DoxygenToolkit_briefTag_funcName 	= "yes"
let g:DoxygenToolkit_briefTag_pre 		= " @brief "
let g:DoxygenToolkit_paramTag_pre 		= " @param "
let g:DoxygenToolkit_returnTag 			= " @return "
let g:DoxygenToolkit_authorName 		= "钟腾辉"
let g:DoxygenToolkit_licenseTag 		= "zhong teng hui"  
let g:DoxygenToolkit_startCommentTag 	= "/**********************************************************************"
let g:DoxygenToolkit_startCommentBlock 	= "/* "
let g:DoxygenToolkit_interCommentBlock 	= "*"
let g:DoxygenToolkit_interCommentTag 	= "*"
let g:DoxygenToolkit_endCommentTag 		= "**********************************************************************/"
let g:DoxygenToolkit_endCommentBlock 	= "*/"

nnoremap <silent><leader>dox <esc>:Dox<cr>
inoremap <silent><leader>dox <esc>:Dox<cr>
