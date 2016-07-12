"==============================================================
"    file: vim-windowswap.vimrc
"   brief: 交换两个窗口
" 
"    nmap: <leader>sw 标志窗口，交换窗口
" VIM Version: 7.4
"  author: tenfyzhong
"   email: 364755805@qq.com
" created: 2016-07-10 23:34:05
"==============================================================
PluginAdd 'wesQ3/vim-windowswap'

let g:windowswap_map_keys = 0

if exists('g:windowswap_setting')
    finish
endif

let g:windowswap_setting = 1

nnoremap <silent><unique><leader>sw :call WindowSwap#EasyWindowSwap()<CR>
