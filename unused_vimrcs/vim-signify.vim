"==============================================================
"    file: vim-signify.vim
"   brief: 显示文件行的修改状态
"
" command: SignifyEnable 打开Signify
"          SignifyDisable 关闭Signify
"          SignifyToggle 触发Signify
"          SignifyToggleHighlight 触发修改的行高亮
"          SignifyRefresh 刷新Signify
"          SignifyFold[!] 打开一个新tab，没有修改的行被折叠起来
"          SignifyList 列出每个buffer的信息
"          SignifyDebug 调度
"
"    nmap: ]c 跳到下一个修改的位置
"          [c 跳到上一个修改的位置
"          ]C 跳到最后一个修改的位置
"          [C 跳到第一个个性的位置
" VIM Version: 8.0
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2017-07-19 14:10:52
"==============================================================
finish
Plug 'mhinz/vim-signify'

let g:signify_vcs_list = ['git']
