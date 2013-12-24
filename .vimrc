"**********************************************************************
" source $VIMRUNTIME/mswin.vim
source $VIMRUNTIME/vimrc_example.vim
set nu " 显示行号
set nocompatible " 关闭vi兼容模式
set cindent " C语言缩进方式
set fileencoding=utf-8
set fileencodings=utf-8,gbk,gb2312,cp936,usc-bom,euc-jp,gb18030
set mouse= " 禁用鼠标
set wrapmargin=4
set textwidth=0
set backspace=2 " 使回格键正常处理indet,eol,start 等
set iskeyword+=- " 设为字，遇到这些字符时不断行
set whichwrap+=<,>,h,l	" 允许backspace和光标键跨越行边界
set formatoptions=tcrqn " 自动格式化
set autochdir " 自动切换工作目录为当前文件所在的目录
filetype plugin on " 开启文件识别
syntax on
set autowrite " 文件跳转时自动保存

" tab缩进4
set ts=4
set sw=4

nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
"**********************************************************************
