" c.vim
if !exists('C_VIM_VIMRC')
let C_VIM_VIMRC = 1

" 帮助: help csupport
let g:C_GuiSnippetBrowser 	= 'commandline'
let g:C_CFlags 				= '-Wall -g -o0 -c -std=c++0x'

let g:C_LocalTemplateFile 	= $HOME . '/.vim/templates/csupport/Templates'

endif
