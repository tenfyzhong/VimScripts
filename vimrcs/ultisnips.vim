"==============================================================
"    file: ultisnips.vimrc
"   brief: 提供snippet
"
" command: UltiSnipsEdit[!] 为当前filetype打开一个snippet编辑窗口
"          UltiSnipsAddFileTypes 合并其他文件类型的snippet
"
"    imap: <c-j>展开
"          <c-tab>列出snippets
"          <c-j>跳到下一个位置
"          <c-k>跳到上一个位置
" VIM Version: 7.4
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2016-04-15 12:52:50
"==============================================================
if !has('python') && !has('python3')
    finish
endif

PluginAdd 'SirVer/ultisnips', 1
PluginAdd 'honza/vim-snippets'
PluginAdd 'tenfyzhong/tsnippets.vim'

let g:UltiSnipsEditSplit     = "horizontal"
let g:UltiSnipsExpandTrigger = '<c-j>'
