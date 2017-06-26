"==============================================================
"    file: vim-move.vim
"   brief: 移动行
"
"    nmap: <m-j> 当前行下移
"          <m-k> 当前行上移
"    smap: <m-j> 当前块下移
"          <m-k> 当前块上移  
" VIM Version: 8.0
"  author: tenfyzhong
"   email: tenfyzhong@qq.com
" created: 2017-06-23 23:01:11
"==============================================================
PluginAdd 'matze/vim-move'

let g:move_key_modifier = 'M'
let g:move_auto_indent = 0
let g:move_map_keys = 0
