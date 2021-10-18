"==============================================================
"    file: YankRing.vim
"   brief: 管理粘贴列表
"
" command: YRToggle 触发yankring
"          YRClear 清空yankring
"          YRShow 显示yankring
"          YRGetElem 选择元素
"          YRGetMultiple[!] n 选择1~n个元素
"          YRPush 插入元素
"          YRPop 取出元素
"          YRYankCount add the text to the yankring
"          YRYankRange 只能在visual模式使用，将选中的元素插入到yankring中
"          YRDeleteRange 删除范围
"          YRPaste 粘贴元素
"          YRReplace 替换粘贴的元素
"          YRMapsCreate 创建map
"          YRMapsDelete 删除maps
"          YRSearch 搜索yankring
"          YRCheckClipboard 从粘贴版中取元素到yankring
"          YRRunAfterMaps 
"
"    nmap: <leader>yj 选择yankring中的下一个进行替换
"          <leader>yk 选择yankring中的上一个进行替换
" VIM Version: 7.4
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2016-04-16 15:49:12
"==============================================================
Plug 'tenfyzhong/YankRing.vim'

let g:yankring_history_file = '.yankring_history'

let g:yankring_replace_n_pkey = '<leader>yj'
let g:yankring_replace_n_nkey = '<leader>yk'

if !exists("g:yankring_init")
    nnoremap <silent><leader>yr :YRShow<cr>
    nnoremap <silent><leader>ys :YRSearch<cr>
endif

let g:yankring_init = 1

