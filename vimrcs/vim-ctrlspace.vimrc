"==============================================================
"    file: vim-ctrlspace.vimrc
"   brief: 
" VIM Version: 7.4
"  author: tenfyzhong
"   email: 364755805@qq.com
" created: 2016-07-10 23:36:51
"==============================================================
if g:MSWIN
    finish
endif
PluginAdd 'vim-ctrlspace/vim-ctrlspace'

if executable("ag")
    let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif

" let g:CtrlSpaceSearchTiming = 500
let g:CtrlSpaceUseUnicode = 0
" let g:CtrlSpaceSaveWorkspaceOnExit = 1
" let g:CtrlSpaceSaveWorkspaceOnSwitch = 1

if exists('g:CtrlSpaceIgnoredFiles')
    let g:CtrlSpaceIgnoredFiles .= '\|'
else
    let g:CtrlSpaceIgnoredFiles = ''
endif

let g:CtrlSpaceIgnoredFiles .= '\%(tmp\|temp\|bin\|lib\|obj\|bak\)[\/]\|.*\.\%(jpg\|a\|o\|d\|so\|jpeg\|bak\)$'
