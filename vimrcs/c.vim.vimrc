"**********************************************************************
"Bundle 'c.vim'
" 帮助: help csupport
if g:plugin_exist("c.vim")
	let g:C_GuiSnippetBrowser = 'commandline'

	if globpath("~/.vim/templates/csupport/", "Templates")
		let g:C_LocalTemplateFile = $HOME . '/.vim/templates/csupport/Templates'
	endif
endif
"**********************************************************************
