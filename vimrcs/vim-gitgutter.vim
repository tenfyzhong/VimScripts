"==============================================================
"    file: vim-gitgutter.vimrc
"   brief: 显示文件行的修改状态
"
" command: GitGutterDisable 关闭GitGutter
"          GitGutterEnable 打开GitGutter
"          GitGutterToggle 触发GitGutter
"          GitGutter 更新状态
"          GitGutterAll 更新所有buffer的状态
"          GitGutterSignsEnable 打开行状态
"          GitGutterSignsDisable 关闭行状态
"          GitGutterSignsToggle 触发行状态
"          GitGutterLineHighlightsEnable 打开高亮
"          GitGutterLineHighlightsDisable 关闭高亮
"          GitGutterLineHighlightsToggle  触发高亮
"          GitGutterNextHunk 跳到下一个修改的块
"          GitGutterPrevHunk 跳到上一个修改的块
"          GitGutterStageHunk 将当前块添加到stage区
"          GitGutterRevertHunk 回滚当前块的stage区
"          GitGutterPreviewHunk 预览当前块
"
"        nmap: 
"          [h GitGutterPrevHunk
"          ]h GitGutterNextHunk
"          <leader>ga GitGutterStageHunk
"          <leader>gr GitGutterRevertHunk
"          <leader>gp GitGutterPreviewHunk
"          <leader>gg :GitGutter
" VIM Version: 7.4
"  author: tenfyzhong
"   email: 364755805@qq.com
" created: 2016-04-15 14:56:52
"==============================================================
PluginAdd 'airblade/vim-gitgutter'

if system#IsUnixInMswin()
    let g:gitgutter_sign_removed_first_line = '*'
endif

let g:gitgutter_map_keys    = 0
let g:gitgutter_escape_grep = 1

nmap [h <Plug>GitGutterPrevHunk
nmap ]h <Plug>GitGutterNextHunk
nmap <Leader>ga <Plug>GitGutterStageHunk
nmap <Leader>gr <Plug>GitGutterRevertHunk
nmap <Leader>gp <Plug>GitGutterPreviewHunk
nnoremap <silent><Leader>gg :GitGutter<cr>

