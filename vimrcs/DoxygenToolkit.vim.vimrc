"**********************************************************************
if g:plugin_exist("DoxygenToolkit.vim")
	let g:load_doxygen_syntax 				= 1
	let g:doxygen_enhanced_color 			= 1
	let g:DoxygenToolkit_briefTag_funcName 	= "yes"
	let g:DoxygenToolkit_briefTag_pre 		= "@Synopsis "
	let g:DoxygenToolkit_paramTag_pre 		= "@Param "
	let g:DoxygenToolkit_returnTag 			="@Return "
	let g:DoxygenToolkit_authorName 		="钟腾辉"
	let g:DoxygenToolkit_licenseTag 		="zhong teng hui"  
	let g:DoxygenToolkit_startCommentTag 	= "/**********************************************************************"
	let g:DoxygenToolkit_startCommentBlock 	= "/* "
	let g:DoxygenToolkit_interCommentBlock 	= "*"
	let g:DoxygenToolkit_interCommentTag 	= "*"
	let g:DoxygenToolkit_endCommentTag 		= "**********************************************************************/"
	let g:DoxygenToolkit_endCommentBlock 	= "*/"

	nnoremap <silent><leader>dox <esc>:Dox<cr>
	inoremap <silent><leader>dox <esc>:Dox<cr>

endif
"**********************************************************************
