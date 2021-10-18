"==============================================================
"    file: diffchar.vim
"   brief: 字符的diff
"
"    nmap:
"        <leader>dg get diff字符
"        <leader>dp put diff字符
" VIM Version: 7.4
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2016-06-13 11:15:22
"==============================================================
Plug 'rickhowe/diffchar.vim'
let g:DiffPairVisible = 0

nmap  <leader>dg <Plug>GetDiffCharPair
nmap  <leader>dp <Plug>PutDiffCharPair
