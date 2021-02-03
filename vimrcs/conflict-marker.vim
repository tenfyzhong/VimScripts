"==============================================================
"    file: conflict-marker.vim
"   brief: 冲突的处理
"
" command: 
"         ConflictMarkerThemselves
"         ConflictMarkerOurselves
"         ConflictMarkerBoth
"         ConflictMarkerNone
"         ConflictMarkerNextHunk
"         ConflictMarkerPrevHunk
"         ConflictMarkerEnable 开启conflict marker模式
"         ConflictMarkerDisable 关闭conflict marker模式
"    nmap:
"         [x 跳到上一个冲突
"         ]x 跳到下一个冲突
"         ct 使用它们
"         co 使用自己
"         cn 都不使用
"         cb 都使用
" VIM Version: 8.0
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2019-06-13 09:23:52
"==============================================================
PluginAdd 'tenfyzhong/conflict-marker.vim'

let g:conflict_marker_enable_hooks = 1
let g:conflict_marker_enable_mappings = 1
let g:conflict_marker_enable_highlight = 1
