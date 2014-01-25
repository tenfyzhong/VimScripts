" grep.vim
if !exists('GREP_VIM_VIMRC')
let GREP_VIM_VIMRC = 1

let Grep_Skip_Dirs 			= '.git .svn'
let Grep_Skip_Files 		= '*.bak *~ \#*\#'
let Grep_Default_Filelist 	= '*.h *.cpp *.ice'

endif
