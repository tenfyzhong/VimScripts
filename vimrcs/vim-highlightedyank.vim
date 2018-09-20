"==============================================================
"    file: vim-highlightedyank.vim
"   brief: 
" VIM Version: 8.0
"  author: zhongtenghui
"   email: zhongtenghui@gf.com.cn
" created: 2018-09-20 09:11:17
"==============================================================
PluginAdd 'machakann/vim-highlightedyank'

if !exists('##TextYankPost')
  map y <Plug>(highlightedyank)
endif

let g:highlightedyank_highlight_duration = 200
