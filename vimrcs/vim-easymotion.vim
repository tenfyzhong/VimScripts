"==============================================================
"    file: vim-easymotion.vim
"   brief: 比普通的移动更强大的移动
"
"    nmap:
"    Default Mapping   | Details
"    ------------------|----------------------------------------------
"    <tab>f{char}      | Find {char} to the right. See |f|.
"    <tab>F{char}      | Find {char} to the left. See |F|.
"    <tab>t{char}      | Till before the {char} to the right. See |t|.
"    <tab>T{char}      | Till after the {char} to the left. See |T|.
"    <tab>w            | Beginning of word forward. See |w|.
"    <tab>W            | Beginning of WORD forward. See |W|.
"    <tab>b            | Beginning of word backward. See |b|.
"    <tab>B            | Beginning of WORD backward. See |B|.
"    <tab>e            | End of word forward. See |e|.
"    <tab>E            | End of WORD forward. See |E|.
"    <tab>ge           | End of word backward. See |ge|.
"    <tab>gE           | End of WORD backward. See |gE|.
"    <tab>j            | Line downward. See |j|.
"    <tab>k            | Line upward. See |k|.
"    <tab>n            | Jump to latest "/" or "?" forward. See |n|.
"    <tab>N            | Jump to latest "/" or "?" backward. See |N|.
"    <tab>s            | Find(Search) {char} forward and backward. See |f| and |F|.
"          <tab>J 跳到下面一行的开头
"          <tab>K 跳到上面一行的开头
"          <tab>; 跳到上个模式的下一个位置
"          <tab>, 跳到上个模式的上一个位置
"          <tab>. 重复操作
"          <tab>F 跨窗口的查找
"          <tab>L 跨窗口跳到某行
"          <tab>W 跨窗口跳到某个单词
"
" VIM Version: 7.4
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2016-04-13 19:34:15
"==============================================================
PluginAdd 'easymotion/vim-easymotion'

map <tab> <Plug>(easymotion-prefix)

let g:EasyMotion_keys = 'asdfghjklqwertyuiopzxcvbnm'
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0 
let g:EasyMotion_verbose = 0

nmap <tab>J <Plug>(easymotion-sol-j)
nmap <tab>K <Plug>(easymotion-sol-k)
nmap <tab>; <Plug>(easymotion-next)
nmap <tab>, <Plug>(easymotion-prev)
nmap <tab>. <Plug>(easymotion-repeat)

" 以下命令可以跨窗口
nmap <tab>F <Plug>(easymotion-overwin-f)
nmap <tab>L <Plug>(easymotion-overwin-line)
nmap <tab>W <Plug>(easymotion-overwin-w)

hi EasyMotionTarget2First ctermbg=none ctermfg=DarkBlue
hi EasyMotionTarget2Second ctermbg=none ctermfg=DarkBlue
