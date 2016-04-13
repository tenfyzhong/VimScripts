"==============================================================
"    file: vim-easymotion.vimrc
"   brief: 比普通的移动更强大的移动
"
"    nmap: <leader><leader>h 行往左
"          <leader><leader>l 行往右
"          <leader><leader>s 搜索
"          <leader><leader>J 跳到下面一行的开头
"          <leader><leader>K 跳到上面一行的开头
"          <leader><leader>; 跳到上个模式的下一个位置
"          <leader><leader>, 跳到上个模式的上一个位置
"          <leader><leader>f 跨窗口的查找
"          <leader><leader>L 跨窗口跳到某行
"          <leader><leader>W 跨窗口跳到某个单词
"          <leader><leader>w 跳到后面某个单词
"          <leader><leader>b 跳到前面某个单词
"
" VIM Version: 7.4
"  author: tenfyzhong
"   email: 364755805@qq.com
" created: 2016-04-13 19:34:15
"==============================================================
PluginAdd 'easymotion/vim-easymotion'

let g:EasyMotion_keys = 'asdfghjkl;qwertyuiopzxcvbnm'
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0 

map  <Leader><leader>h <Plug>(easymotion-linebackward)
map  <Leader><leader>l <Plug>(easymotion-lineforward)
map  <leader><leader>s <Plug>(easymotion-sn)
nmap <leader><Leader>J <Plug>(easymotion-sol-j)
nmap <leader><Leader>K <Plug>(easymotion-sol-k)
nmap <Leader><leader>; <Plug>(easymotion-next)
nmap <Leader><leader>, <Plug>(easymotion-prev)
nmap <Leader><leader>. <Plug>(easymotion-repeat)

" 以下命令可以跨窗口
map  <leader><leader>f <Plug>(easymotion-bd-f)
nmap <leader><Leader>f <Plug>(easymotion-overwin-f)
map  <leader><Leader>L <Plug>(easymotion-bd-jk)
nmap <leader><Leader>L <Plug>(easymotion-overwin-line)
map  <leader><Leader>W <Plug>(easymotion-bd-w)
nmap <leader><Leader>W <Plug>(easymotion-overwin-w)


