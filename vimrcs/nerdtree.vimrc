"**********************************************************************
" The NERD tree 以树形结构浏览文件夹中的文件
Bundle 'scrooloose/nerdtree'
if g:plugin_exist("nerdtree")
	" echom "nerdtree plugin"
	nmap <silent><leader>ntt :NERDTreeToggle<cr>
	let NERDTreeIgnore=['/.vim$','/~$'] " 不显示指定的内容
	let NERDTreeShowHidden=0 "	不显示隐藏文件
	let NERDTreeSortOrder=['//$','/.cpp$','/.c$','/.h$','*']	" 排序
	let NERDTreeCaseSensitiveSort=0	" 不分大小写排序
	let NERDTreeWinsize=30
	let NERDTreeShowBookmarks=1
	let NERDTreeQuitOnOpen=1	" 打开文件后，关闭NERDTree窗口
	let NERDTreeHightlightCursorline=1	"高亮NERDTree窗口的当前行
endif
"**********************************************************************
