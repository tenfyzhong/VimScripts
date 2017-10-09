"==============================================================
"    file: vim-choosewin.vim
"   brief: 选择window
"
" command:
"         ChooseWin 选择window
"         ChooseWinSwap 交换window位置
"         ChooseWinSwapStay 交换window位置，保持光标不动
"
"    nmap:   <leader>sw ChooseWin
"
"   ChooseWin状态的key
"	| Key  | Action     | Description                   |
"	| ---- | ---------- | ----------------------------- |
"	| 0    | tab_first  | Select FIRST    tab           |
"	| [    | tab_prev   | Select PREVIOUS tab           |
"	| ]    | tab_next   | Select NEXT     tab           |
"	| $    | tab_last   | Select LAST     tab           |
"	| x    | tab_close  | Close current tab             |
"	| ;    | win_land   | Navigate to current window    |
"	| -    | previous   | Naviage to previous window    |
"	| s    | swap       | Swap windows               #1 |
"	| S    | swap_stay  | Swap windows but stay      #1 |
"	| <CR> | win_land   | Navigate to current window    |
"	|      | <NOP>      | Disable predefined keymap     |
" VIM Version: 8.0
"  author: tenfy
"   email: tenfy@tenfy.cn
" created: 2017-08-31 21:47:11
"==============================================================
PluginAdd 't9md/vim-choosewin'

nmap <leader>sw <Plug>(choosewin)
