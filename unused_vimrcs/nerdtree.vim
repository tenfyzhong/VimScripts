"==============================================================
"    file: nerdtree.vim
"   brief: 目录树浏览
"
" command: NERDTree [<start-directory> | <bookmark>] 打开nerdtree
"          NERDTreeFromBookmark bookmark 在书签处打开nerdtree
"          NERDTreeToggle [<start-directory> | <bookmark>] 触发nerdtree
"          NERDTreeMirror 使用其他的nerdtree镜像
"          NERDTreeClose 关闭nerdtree
"          NERDTreeFind 在当前的目录树中查找文件
"          NERDTreeCWD 将目录树的根目录切到当前目录
"
" nerdtree buffer下的命令
" command: Bookmark [<name>] 用name给当前结点打标签
"          BookmarkToRoot <bookmark> 切到bookmark目录下,并以此为根目录
"          RevealBookmark <bookmark> 定位到bookmark处
"          OpenBookmark <bookmark> 此处的bookmark必须是文件,打开bookmark
"          ClearBookmarks [<bookmark>] 清除掉所有的标签,如果没给参数,会清除当所结果下的所有标签
"          ClearAllBookmarks 清除所有的标签
"          ReadBookmarks 重新载入标签
"
"    nmap: <leader>nt toggle nerdtree
"          <leader>nc nerdtree cwd
"          <leader>np nerdtree parrent
"          <leader>nf nerdtree file
" VIM Version: 7.4
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2016-04-14 19:23:56
"==============================================================
Plug 'scrooloose/nerdtree', {'on': ['NERDTree', 'NERDTreeCWD', 'NERDTreeToggle']}
Plug 'Xuyuanp/nerdtree-git-plugin'

let NERDChristmasTree 				= 1
let NERDTreeShowHidden 				= 0 "	不显示隐藏文件
let NERDTreeCaseSensitiveSort 		= 1	" 不分大小写排序
let NERDTreeWinSize 				= 30
let NERDTreeShowBookmarks 			= 1
let NERDTreeQuitOnOpen 				= 0	" 打开文件后，关闭NERDTree窗口
let NERDTreeHightlightCursorline 	= 1	"高亮NERDTree窗口的当前行
let NERDTreeShowLineNumbers 		= 1
let NERDTreeDirArrows 				= 1
let NERDTreeCascadeOpenSingleChildDir = 1
let NERDTreeAutoDeleteBuffer        = 1
let NERDTreeChDirMode               = 2
let NERDTreeMinimalUI               = 1
" 不显示指定的内容
let NERDTreeIgnoreTmp 				= 
            \['\.a$[[file]]', 
            \'\.so$[[file]]', 
            \'\.o$[[file]]', 
            \'\.swp$[[file]]', 
            \'\.bak$[[file]]', 
            \'\~$[[file]]', 
            \'\.d$[[file]]',
            \'^tags$[[file]]', 
            \'\.git$[[dir]]', 
            \'\.out$[[file]]', 
            \'\.session$[[dir]]', 
            \'\.viminfo$[[dir]]', 
            \'\.d.\d*$[[file]]', 
            \'cscope.*out$[[file]]', 
            \'\.pyc$[[file]]'] 
let NERDTreeSortOrder = ['\/$', '*', '^mock_.*\.go$', '_test\.py$', '_test\.go$', '^test_.*\.py$']
if exists('NERDTreeIgnore')
    let NERDTreeIgnore += NERDTreeIgnoreTmp
else
    let NERDTreeIgnore = NERDTreeIgnoreTmp
endif

" 从工程目录中去读取bookmark的文件，不存在则使用默认的
let b:bookmarks_filename            = '.NERDTreeBookmarks'
let b:NERDTreeBookmarksFile_tmp     = file#FindFile(getcwd(), b:bookmarks_filename)           
if b:NERDTreeBookmarksFile_tmp != ''
    let NERDTreeBookmarksFile       = b:NERDTreeBookmarksFile_tmp . b:bookmarks_filename
endif

augroup nerdtree_autocmd_init
    autocmd!
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END

nnoremap <silent><leader>nt :NERDTreeToggle<cr>
nnoremap <silent><leader>nc :NERDTreeCWD<cr>
nnoremap <silent><leader>np :NERDTree ..<cr>
nnoremap <silent><leader>nf :NERDTree %<cr>

