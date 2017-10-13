"==============================================================
"    file: smart-tabline.vim
"   brief: 
"
"    nmap:
"       <leader>h 选择左边的buffer
"       <leader>l 选择右边的buffer
" VIM Version: 8.0
"  author: tenfy
"   email: tenfy@tenfy.cn
" created: 2017-07-10 09:02:47
"==============================================================
PluginAdd 'tenfyzhong/smart-tabline.vim'

nmap <leader>l <Plug>(ctrlspace#mapping#NextBuffer)
nmap <leader>h <Plug>(ctrlspace#mapping#PreviousBuffer)
