"==============================================================
"    file: vim-ctrlspace.vimrc
"   brief: 管理文件
"
" command: CtrlSpace [keys] 显示ctrlspace
"          CtrlSpaceGoUp 跳到上一个buffer
"          CtrlSpaceGoDown 跳到下一个buffer
"          CtrlSpaceTabLabel 修改tab名
"          CtrlSpaceSaveWorkspace [workspace] 保存workspace
"          CtrlSpaceNewWorkspace 新建workspace
"          CtrlSpaceLoadWorkspace[!] [workspace] 加载workspace
"          CtrlSpaceAddProjectRoot [directory] 添加一个工程目录
"          CtrlSpaceRemoveProjectRoot [directory] 删除一个工程目录
"
" ctrlspace下的快捷键
" | Key | Action                                                |
" | --- | ----------------------------------------------------- |
" | `h`   | Toggle Buffer List (aka `H`ome List)                    |
" | `H`   | Jump to Buffer List (aka `H`ome List) with Search Mode  |
" | `o`   | Toggle File List (aka `O`pen List)                      |
" | `O`   | Jump to File List (aka `O`pen List) with Search Mode    |
" | `l`   | Toggle Tab List (aka `L`ists List)                      |
" | `L`   | Jump to Tab List (aka `L`ists List) with Search Mode    |
" | `w`   | Toggle `W`orkspace List                                 |
" | `W`   | Jump to `W`orkspace List with Search Mode               |
" | `b`   | Toggle `B`ookmark List                                  |
" | `B`   | Jump to `B`ookmark List with Search Mode                |
" VIM Version: 7.4
"  author: tenfyzhong
"   email: 364755805@qq.com
" created: 2016-07-10 23:36:51
"==============================================================
finish
if g:MSWIN
    finish
endif
PluginAdd 'vim-ctrlspace/vim-ctrlspace'

if executable("ag")
    let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif

" let g:CtrlSpaceSearchTiming = 500
if has('mac')
    let g:CtrlSpaceUseUnicode = 1
else
    let g:CtrlSpaceUseUnicode = 0
endif
" let g:CtrlSpaceSaveWorkspaceOnExit = 1
" let g:CtrlSpaceSaveWorkspaceOnSwitch = 1

if exists('g:CtrlSpaceIgnoredFiles')
    let g:CtrlSpaceIgnoredFiles .= '\|'
else
    let g:CtrlSpaceIgnoredFiles = ''
endif

let g:CtrlSpaceIgnoredFiles .= '^\%(tmp\|temp\|bin\|lib\|obj\|bak\)[\/]\|.*\.\%(jpg\|a\|o\|d\|so\|jpeg\|bak\)$'

nnoremap <silent><c-h> :<c-u>CtrlSpaceGoUp<cr>
nnoremap <silent><c-l> :<c-u>CtrlSpaceGoDown<cr>

