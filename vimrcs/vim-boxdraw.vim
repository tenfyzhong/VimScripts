"==============================================================
"    file: vim-boxdraw.vim
"   brief: 画图
"
" command:
"          BoxdrawEnable  开启画图模式
"          BoxdrawDisable 关闭画图模式
"          BoxdrawToggle  开启/关闭画图模式
"
"    nmap:
"          <leader>bt  BoxdrawToggle
"
" VIM Version: 8.0
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2019-04-22 10:33:49
"==============================================================
PluginAdd 'tenfyzhong/vim-boxdraw'

nmap <leader>bt <Plug>(boxdraw-toggle)
