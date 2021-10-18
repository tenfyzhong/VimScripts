"==============================================================
"    file: undotree.vim
"   brief: undo历史树
"
"    nmap: <leader>ut 触发undotree
" VIM Version: 8.0
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2019-08-16 10:05:32
"==============================================================
Plug 'mbbill/undotree'

nnoremap <leader>ut :UndotreeToggle<cr>

let g:undotree_WindowLayout = 3
let g:undotree_DiffpanelHeight = 30
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
