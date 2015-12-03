" taglist
if version >= 701
    finish
endif

PluginAdd 'vim-scripts/taglist.vim'

let Tlist_Ctags_Cmd 				= 'ctags'
let Tlist_Show_One_File 			= 1
let Tlist_OnlyWindow 				= 1
let Tlist_use_Right_Window 			= 0
let Tlist_Sort_Type 				= 'name'
let Tlist_Exit_OnlyWindow 			= 1
let Tlist_Show_Menu 				= 1
let Tlist_Max_Submenu_Items 		= 10
let Tlist_Max_Tag_length 			= 20
let Tlist_Use_SingleClick 			= 0
let Tlist_Auto_Open 				= 0
let Tlist_Close_On_Select 			= 0
let Tlist_File_Fold_Auto_Close 		= 1
let Tlist_GainFocus_On_ToggleOpen 	= 0
let Tlist_Process_File_Always 		= 1
let Tlist_WinHeight 				= 10
let Tlist_WinWidth 					= 18
let Tlist_Use_Horiz_Window 			= 0

if !exists("g:taglist_vim_maps")
    let g:taglist_vim_maps = 1
    nnoremap <unique><silent><leader>tt :TlistToggle<cr>
endif

