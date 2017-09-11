"==============================================================
"    file: auto-pairs.vimrc
"   brief: 自动补齐括号
"
" (in)map: \ap 开启和关闭auto-pairs
"          \ae 将后面的单词放到当前括号里
"          \an 跳到下一个补齐的括号
" VIM Version: 7.4
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2016-07-31 23:21:56
"==============================================================
PluginAdd 'jiangmiao/auto-pairs'

let g:AutoPairsShortcutToggle = '\ap'
let g:AutoPairsShortcutFastWrap = '\ae'
let g:AutoPairsShortcutJump = '\an'
let g:AutoPairsShortcutBackInsert = ''

let g:AutoPairs = {'[':']', '{':'}',"'":"'",'"':'"', '`':'`'}
inoremap <buffer><silent> ) <C-R>=AutoPairsInsert(')')<CR>
