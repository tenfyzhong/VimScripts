"==============================================================
"    file: vim-tmux-navigator.vim
"   brief: 使切窗口与tmux一致
"
"    nmap: <c-h> 跳到左边窗口
"          <c-j> 跳到下边窗口
"          <c-k> 跳到上边窗口
"          <c-l> 跳到右边窗口
" VIM Version: 7.4
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2017-04-21 09:36:42
"==============================================================
PluginAdd 'christoomey/vim-tmux-navigator'

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
