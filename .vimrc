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
autocmd! bufwritepost .vimrc source %
autocmd! bufwritepost _vimrc source %
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
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

nnoremap <leader>bi :BundleInstall<cr>

" let Vundle manage Vundle
Bundle 'gmarik/vundle'
"**********************************************************************

"**********************************************************************
" 比taglist更现代的代码结构浏览工具
if version >= 701
	Bundle 'majutsushi/tagbar'
	nnoremap <silent><leader>tt :TagbarToggle<CR>
else
	Bundle 'vim-scripts/taglist.vim'
	let Tlist_Ctags_Cmd='ctags'
	let Tlist_Show_One_File=1
	let Tlist_OnlyWindow=1
	let Tlist_use_Right_Window=0
	let Tlist_Sort_Type='name'
	let Tlist_Exit_OnlyWindow=1
	let Tlist_Show_Menu=1
	let Tlist_Max_Submenu_Items=10
	let Tlist_Max_Tag_length=20
	let Tlist_Use_SingleClick=0
	let Tlist_Auto_Open=0
	let Tlist_Close_On_Select=0
	let Tlist_File_Fold_Auto_Close=1
	let Tlist_GainFocus_On_ToggleOpen=0
	let Tlist_Process_File_Always=1
	let Tlist_WinHeight=10
	let Tlist_WinWidth=18
	let Tlist_Use_Horiz_Window=0

	map <silent><leader>tt :TlistToggle<cr>
endif
"**********************************************************************

"**********************************************************************
" ctags
set tags=tags
nmap <silent><leader>tg :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q<cr>
"**********************************************************************

"**********************************************************************
" ywvim
Bundle 'vim-scripts/ywvim'
"**********************************************************************

"**********************************************************************
Bundle 'winmanager'
let g:winManagerWindowLayout='FileExplorer|TagList'
let g:persitentBehaviour=0
let g:winManagerWidth=20
let g:defaultExplorer=1
nmap <silent><leader>wm :WMToggle<cr>
"**********************************************************************

"**********************************************************************
Bundle 'a.vim'
"**********************************************************************

"**********************************************************************
Bundle 'c.vim'
"**********************************************************************

"**********************************************************************
Bundle 'Rip-Rip/clang_complete'
let g:clang_auto_select=1	" 0不选择，1选择第一项，2选择第一项并插入
let g:clang_trailing_place_holder=1
let g:clang_complete_copen=1
let g:clang_periodic_quickfix=1
let g:clang_snippets=1
let g:clang_close_preview=1
let g:clang_use_library=1
let g:clang_use_options='-stdlib=libc++ -std=c++11'
nnoremap <leader>gc :!~/.vim/bin/generate_clang_complete.sh<cr> 
"**********************************************************************

"**********************************************************************
" The NERD tree 以树形结构浏览文件夹中的文件
Bundle 'scrooloose/nerdtree'
nmap <silent><leader>ntt :NERDTreeToggle<cr>
let NERDTreeIgnore=['/.vim$','/~$'] " 不显示指定的内容
let NERDTreeShowHidden=0 "	不显示隐藏文件
let NERDTreeSortOrder=['//$','/.cpp$','/.c$','/.h$','*']	" 排序
let NERDTreeCaseSensitiveSort=0	" 不分大小写排序
let NERDTreeWinsize=30
let NERDTreeShowBookmarks=1
let NERDTreeQuitOnOpen=1	" 打开文件后，关闭NERDTree窗口
let NERDTreeHightlightCursorline=1	"高亮NERDTree窗口的当前行
"**********************************************************************

"**********************************************************************
Bundle 'FindMate'
let g:FindMate_verbose = 'locate'
"**********************************************************************

"**********************************************************************
Bundle 'vim-scripts/minibufexplorerpp'
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplMapWindowNavArrows=1
let g:miniBufExplMapWindowNavVim=1
"**********************************************************************

"**********************************************************************
Bundle 'vim-scripts/grep.vim'
"**********************************************************************

"**********************************************************************
Bundle 'ervandew/supertab'
"let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
"**********************************************************************

"**********************************************************************
" cscope
if has ("cscope")
	set cscopetag " 使支持用Ctrl+]和Ctrl+t 快捷键在代码间跳来跳去
	set csto=0
	set cst

	set nocsverb
	if filereadable ("cscope.out")
		cs add cscope.out
	elseif $CSCOPE_DB != ""
		cs add $CSCOPE_DB
	endif
	set csverb

	nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-_>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>

	nmap <C-Space>s :scs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space>g :scs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space>c :scs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space>t :scs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space>e :scs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-Space>i :scs find i <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-Space>d :scs find d <C-R>=expand("<cword>")<CR><CR>

	nmap <C-Space><C-Space>s /:vert scs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space><C-Space>g /:vert scs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space><C-Space>c /:vert scs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space><C-Space>t /:vert scs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space><C-Space>e /:vert scs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space><C-Space>i /:vert scs find i <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-Space><C-Space>d /:vert scs find d <C-R>=expand("<cword>")<CR><CR>

endif
"**********************************************************************
