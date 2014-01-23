"**********************************************************************
" 基础设置
" source $VIMRUNTIME/mswin.vim
source $VIMRUNTIME/vimrc_example.vim
set nocompatible " 关闭vi兼容模式
set cindent 	 " C语言缩进方式
set fileencoding=utf-8
set fileencodings=utf-8,gbk,gb2312,cp936,usc-bom,euc-jp,gb18030
set mouse=a 		 " 禁用鼠标
set wrapmargin=4
set textwidth=0
set backspace=2 " 使回格键正常处理indet,eol,start 等
set iskeyword+=- " 设为字，遇到这些字符时不断行
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
set ignorecase	" 搜索时忽略大小写
set smartcase	" 有一个或以上大写字母时仍大小写敏感

set wildmenu 	" 增加命令行自动补全操作

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
"**********************************************************************

"**********************************************************************
" 全局变量
let g:load_warn 		= 0
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
" autocmd
" vimrc文件修改之后自动加载
autocmd! bufwritepost *vimrc source %

"**********************************************************************


"**********************************************************************
" 函数
" 加载插件脚本
function! s:load_plugin_vimrc(filename)
	let l:vimrcs = "~/.vim/vimrcs/"

	if globpath(l:vimrcs, a:filename) != ""
		let l:filepathname = l:vimrcs . a:filename
		execute "source " . l:filepathname
	elseif g:load_warn
		echom a:filename . " no exist"
	endif
endfunction

" 判断bundle管理的插件是否存在
function! g:plugin_exist(plugin_name)
	let l:bundle_path 		= "~/.vim/bundle/"
	if globpath(l:bundle_path, a:plugin_name) != ""
		call g:echo_plugin_message(a:plugin_name, 1)
		return 1
	else
		call g:echo_plugin_message(a:plugin_name, 0)
		return 0
	endif
endfunction

function! g:bundle_all_plugin(plugins)
	if g:plugin_exist('vundle')
		for p in a:plugins
		"	Bundle p
			execute "Bundle " . "'" . p . "'"
			let l:vimrc_name = split(p, "/")[-1] . ".vimrc"
			"echo l:vimrc_name
			call s:load_plugin_vimrc(l:vimrc_name)	
		endfor
	endif
endfunction

" 输出加载插件信息
" 不调用g:plugin_exist，不会进行输出控制信息
" 要调用g:echo_plugin_message输出
function! g:echo_plugin_message(message, success)
	if g:load_warn
		if a:success
			echom "load " . a:message . " success"
		else
			echom "load " . a:message . " fail"
		endif
	endif
endfunction
"**********************************************************************

"**********************************************************************
" 调用插件
" 第一步加载vundle
" 第二步加载其他插件
" 第三步加载没有插件的配置
" 注意：插件的配置必须以插件名加.vimrc命名
" 如a.vim的配置为a.vim.vimrc，放在vimrcs目录下
call s:load_plugin_vimrc('vundle.vimrc')

let s:bundle_list = [
	\ 'Rip-Rip/clang_complete',
	\ 'winmanager',
	\ 'a.vim',
	\ 'c.vim',
	\ 'scrooloose/nerdtree',
	\ 'FindMate',
	\ 'fholgado/minibufexpl.vim',
	\ 'vim-scripts/grep.vim',
	\ 'ervandew/supertab',
	\ 'kien/ctrlp.vim',
	\ 'tpope/vim-fugitive',
	\ 'magic-dot-files/TagHighlight',
	\ 'vim-scripts/DoxygenToolkit.vim',
	\ 'vim-jp/cpp-vim',
	\ 'Raimondi/delimitMate',
	\ 'tpope/vim-surround',
	\]
"	\ 'Lokaltog/powerline'
"	\ 'ywvim.vimrc',
"	\ 'neocomplcache.vim.vimrc',
"	\ 'YouCompleteMe.vimrc',
"	\ 'syntastic.vimrc',

if version >= 701
	call add(s:bundle_list, 'majutsushi/tagbar')
else
	call add(s:bundle_list, 'vim-scripts/taglist.vim')
endif

call g:bundle_all_plugin(s:bundle_list)


let s:vimrc_name_list = [
	\ 'ctags.vimrc',
	\ 'cscope.vimrc',
	\ 'quickfix.vimrc',
	\	]

for vimrc_name in s:vimrc_name_list
	call s:load_plugin_vimrc(vimrc_name)
endfor
"**********************************************************************
