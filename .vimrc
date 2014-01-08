"**********************************************************************
" 基础设置
" source $VIMRUNTIME/mswin.vim
source $VIMRUNTIME/vimrc_example.vim
set nocompatible " 关闭vi兼容模式
set cindent 	 " C语言缩进方式
set fileencoding=utf-8
set fileencodings=utf-8,gbk,gb2312,cp936,usc-bom,euc-jp,gb18030
set mouse= 		 " 禁用鼠标
set wrapmargin=4
set textwidth=0
set backspace=2 " 使回格键正常处理indet,eol,start 等
set iskeyword+=- " 设为字，遇到这些字符时不断行
set whichwrap+=<,>,h,l	" 允许backspace和光标键跨越行边界
set formatoptions=tcrqn " 自动格式化
set autochdir " 自动切换工作目录为当前文件所在的目录
set autowrite " 文件跳转时自动保存

set shortmess=atI	" 启动的时候不显示援助乌干达儿童提示
set autoread	" 文件修改后自动载入

set showmatch	" 括号匹配
set ruler		" 显示标尺
set showmode	" 显示输入的命令
set confirm		" 在处理未保存或只读文件的时候，弹出确认

" vimrc文件修改之后自动加载
autocmd! bufwritepost *vimrc source %
autocmd FileType *
  \ if &omnifunc != '' |
  \   call SuperTabChain(&omnifunc, "<c-p>") |
  \   call SuperTabSetDefaultCompletionType("<c-x><c-u>") |
  \ endif

let g:load_vimrc_warn 	= 1
"**********************************************************************

"**********************************************************************
" 全局快捷键
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <F12> <C-w>w	" F12 窗口切换
"**********************************************************************

"**********************************************************************
" 显示相关
"set cursorcolumn		" 高亮当前列
"set cursorline			" 高亮当前行

" tab缩进4
set ts=4
set sw=4

set nu 			 " 显示行号

" 开启语法高亮
syntax on
syntax enable

filetype on					" 侦测文件类型	
filetype plugin on			" 开启文件识别
filetype indent on			" 针对不同的文件类型采用不同的缩进格式
filetype plugin indent on	" 启动自动补全

set hlsearch	" 高亮search命中的文本
set incsearch	" 随着键入即时搜索
set ignorecase	" 搜索时忽略大小写
set smartcase	" 有一个或以上大写字母时仍大小写敏感
"**********************************************************************

"**********************************************************************
" 函数
function! s:load_plugin_vimrc(filename)
	let l:vimrcs = "~/.vim/vimrcs/"

	if globpath(l:vimrcs, a:filename) != ""
		let l:filepathname = l:vimrcs . a:filename
		execute "source " . l:filepathname
	elseif g:load_vimrc_warn 
		echom "load " . a:filename . " failure"
	endif
endfunction

function! g:plugin_exist(plugin_name)
	let l:bundle_path 		= "~/.vim/bundle/"
	return globpath(l:bundle_path, a:plugin_name) != ""
endfunction
"**********************************************************************

"**********************************************************************
" 调用插件
call s:load_plugin_vimrc("vundle.vimrc") 		" 这一句必须先调用
call s:load_plugin_vimrc("clang_complete.vimrc")
call s:load_plugin_vimrc("tagbar_or_taglist.vimrc")
call s:load_plugin_vimrc("ctags.vimrc")
call s:load_plugin_vimrc("ywvim.vimrc")
call s:load_plugin_vimrc("winmanager.vimrc")
call s:load_plugin_vimrc("a.vim.vimrc")
call s:load_plugin_vimrc("c.vim.vimrc")
call s:load_plugin_vimrc("nerdtree.vimrc")
call s:load_plugin_vimrc("FindMate.vimrc")
call s:load_plugin_vimrc("minibufexplorerpp.vimrc")
call s:load_plugin_vimrc("grep.vim.vimrc")
call s:load_plugin_vimrc("supertab.vimrc")
call s:load_plugin_vimrc("cscope.vimrc")
call s:load_plugin_vimrc("ctrlp.vim.vimrc")
"call s:load_plugin_vimrc("neocomplcache.vim.vimrc")
call s:load_plugin_vimrc("vim-fugitive.vimrc")
call s:load_plugin_vimrc("TagHighlight.vimrc")
"**********************************************************************
