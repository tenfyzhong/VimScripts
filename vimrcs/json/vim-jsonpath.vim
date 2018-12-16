"==============================================================
"    file: vim-jsonpath.vim
"   brief: 打印json节点的位置或者跳到节点
"
"    nmap: <leader>p :JsonPath
"          <leader>g :JsonPath [Path]
"
" command: JsonPath 显示当前的节点位置
"          JsonPath [PATH] 跳到PATH的位置
" VIM Version: 8.0
"  author: zhongtenghui
"   email: zhongtenghui@gf.com.cn
" created: 2018-11-28 13:50:44
"==============================================================
PluginAdd 'mogelbrod/vim-jsonpath'

augroup jsonpath_init
  au!
  au FileType json noremap <buffer><silent><leader>p :JsonPath<cr>
  au FileType json noremap <buffer><silent><expr> <leader>g jsonpath#goto()
augroup end
