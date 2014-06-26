"**********************************************************************
" 基础设置
" source $VIMRUNTIME/mswin.vim
source $VIMRUNTIME/vimrc_example.vim
set nocompatible " 关闭vi兼容模式
set cindent 	 " C语言缩进方式
"set foldmethod=indent   根据缩进折叠
set fileencoding=utf-8
set fileencodings=utf-8,gbk,gb2312,cp936,usc-bom,euc-jp,gb18030
set mouse=a 		 " 禁用鼠标
set wrapmargin=4
set textwidth=0
set backspace=2 " 使回格键正常处理indet,eol,start 等
set iskeyword+= " 设为字，遇到这些字符时不断行
set whichwrap+=<,>,h,l	" 允许backspace和光标键跨越行边界
set formatoptions=tcrqn " 自动格式化
"set autochdir " 自动切换工作目录为当前文件所在的目录
set autowrite " 文件跳转时自动保存

set shortmess=atI	" 启动的时候不显示援助乌干达儿童提示
set autoread	" 文件修改后自动载入

set showmatch	" 括号匹配
set ruler		" 显示标尺
set showmode	" 显示输入的命令
set confirm		" 在处理未保存或只读文件的时候，弹出确认

set hlsearch	" 高亮search命中的文本
set incsearch	" 随着键入即时搜索
"set ignorecase	 搜索时忽略大小写
"set smartcase	 有一个或以上大写字母时仍大小写敏感

set wildmenu 	" 增加命令行自动补全操作

" 显示相关
"set cursorcolumn		" 高亮当前列
"set cursorline			" 高亮当前行

" tab缩进4
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set smarttab

set nu 			 " 显示行号

set backupdir=~/.vim/.backupfile

" 开启语法高亮
syntax on
syntax enable

filetype on					" 侦测文件类型	
filetype plugin on			" 开启文件识别
filetype indent on			" 针对不同的文件类型采用不同的缩进格式
filetype plugin indent on	" 启动自动补全
"**********************************************************************

"**********************************************************************
" autocmd
" vimrc文件修改之后自动加载
augroup initial
    au!
    autocmd bufwritepost *vimrc source %
    autocmd BufNewFile,BufRead makefile,Makefile,MAKEFILE set noexpandtab
augroup END
"**********************************************************************

"**********************************************************************
" 全局变量
let g:warning_message 	= 1
let g:error_message 	= 1
let g:success_message 	= 0
let mapleader 			= "'"
"**********************************************************************

"**********************************************************************
" 全局快捷键
nnoremap <silent><leader>ev 	:split $MYVIMRC<cr>
nnoremap <silent><leader>sv 	:source $MYVIMRC<cr>:echo "source .vimrc success"<cr>
nnoremap <F12> 					<C-w>w	" F12 窗口切换
nnoremap <leader>h 				<c-w>h
nnoremap <leader>j 				<c-w>j
nnoremap <leader>k 				<c-w>k
nnoremap <leader>l 				<c-w>l
nnoremap <c-left> 				<c-w>h
nnoremap <c-down> 				<c-w>j
nnoremap <c-up> 				<c-w>k
nnoremap <c-right> 				<c-w>l
"**********************************************************************

"**********************************************************************
" 加载所有插件vimrc配置
source ~/.vim/vimrcs/LOAD_VIMRCS.vimrc
"**********************************************************************
