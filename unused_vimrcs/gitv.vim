"==============================================================
"    file: gitv.vim
"   brief: 类似gitk的git展示
"
" command: :[range]Gitv[!] [args] 打开gitv窗口,指定range时会打开只影响的行,!会使用file mode替换browser mode
"          :Git 在browser窗口上运行
"
"    nmap: <leader>gv Gitv
" VIM Version: 7.4
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2016-04-14 09:50:35
"==============================================================
Plug 'gregsexton/gitv'

if exists("g:gitv_init")
    finish
endif

nnoremap <silent><leader>gv :Gitv<cr>

let g:gitv_init = 1
