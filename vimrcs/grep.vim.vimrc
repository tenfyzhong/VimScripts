"**********************************************************************
"Bundle 'vim-scripts/grep.vim'
if g:plugin_exist("grep.vim")
	let Grep_Skip_Dirs = '.git .svn'
	let Grep_Skip_Files = '*.bak *~ \#*\#'
	let Grep_Default_Filelist = '*.h *.cpp *.ice'
endif
"**********************************************************************
