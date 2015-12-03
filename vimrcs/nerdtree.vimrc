" nerdtree
PluginAdd 'scrooloose/nerdtree'

" The NERD tree 以树形结构浏览文件夹中的文件
if !exists("g:nerdtree_maps")
    let g:nerdtree_maps = 1
    nnoremap <unique><silent><leader>nt :NERDTreeToggle<cr>
endif

let NERDChristmasTree 				= 1
" 不显示指定的内容
let NERDTreeIgnore 					= ['\.o$', '\.swp$', '\.bak$', '\~$', 
        \'tags', '\.git$', '\.out$', '\.session$', '\.viminfo', '\.d$'] 
let NERDTreeShowHidden 				= 0 "	不显示隐藏文件
let NERDTreeSortOrder 				= ['\/$', '*', '\.h$', '\.cpp$', '\.c$']	" 排序
let NERDTreeCaseSensitiveSort 		= 0	" 不分大小写排序
let NERDTreeWinSize 				= 30
let NERDTreeShowBookmarks 			= 1
let NERDTreeQuitOnOpen 				= 0	" 打开文件后，关闭NERDTree窗口
let NERDTreeHightlightCursorline 	= 1	"高亮NERDTree窗口的当前行
let NERDTreeShowLineNumbers 		= 1
let NERDTreeDirArrows 				= 1

augroup nerdtree
    au!
    autocmd VimLeavePre * NERDTreeClose
augroup END
