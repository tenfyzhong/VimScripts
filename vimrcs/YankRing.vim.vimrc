"==============================================================
"    file: YankRing.vim.vimrc
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
"    nmap: <c-j> 选择yankring中的下一个进行替换
"          <c-k> 选择yankring中的上一个进行替换
" VIM Version: 7.4
"  author: tenfyzhong
"   email: 364755805@qq.com
" created: 2016-04-16 15:49:12
"==============================================================
PluginAdd 'tenfyzhong/YankRing.vim'

let g:yankring_history_file = '.yankring_history'

let g:yankring_replace_n_pkey = '<C-J>'
let g:yankring_replace_n_nkey = '<C-K>'

if !exists("g:yankring_init")
    nnoremap <unique><silent><leader>yr :YRShow
endif

let g:yankring_init = 1
