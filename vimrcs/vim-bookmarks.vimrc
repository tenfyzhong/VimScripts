"==============================================================
"    file: vim-bookmarks.vimrc
"   brief: 给每行插入书签,可以带标签
"
" command: BookmarkToggle 触发书签
"          BookmarkAnnotate <TEXT> 增加/编辑/删除注释标签
"          BookmarkNext 跳到下一个书签
"          BookmarkPrev 跳到上一个书签
"          BookmarkShowAll 在新窗口显示所有书签
"          BookmarkClear 删除当前buffer的书签
"          BookmarkClearAll 删除所有的书签
"          BookmarkMoveup 将当前书签移上一行
"          BookmarkMoveDown 将当前书签移下一行
"          BookmarkSave <FILE_PATH> 保存书签
"          BookmarkLoad <FILE_PATH> 加载书签
"
"    nmap: "MM :BookmarkToggle
"          "MA :BookmarkAnnotate
"          "MS :BookmarkShowAll
"          "MN :BookmarkNext
"          "MP :BookmarkPrev
"          "MC :BookmarkClear
"          "MU :BookmarkMoveUp
"          "MD :BookmarkMoveDown
" VIM Version: 7.4
"  author: tenfyzhong
"   email: 364755805@qq.com
" created: 2016-04-15 20:28:14
"==============================================================
PluginAdd 'MattesGroeger/vim-bookmarks'

let g:bookmark_sign            = ">"
let g:bookmark_annotation_sign = "$"
let g:bookmark_no_default_key_mappings = 1

if exists("g:vim_bookmarks_init")
    finish
endif

nnoremap <unique><silent>"MM :BookmarkToggle<CR>
nnoremap <unique><silent>"MA :BookmarkAnnotate<CR>
nnoremap <unique><silent>"MS :BookmarkShowAll<CR>
nnoremap <unique><silent>"MN :BookmarkNext<CR>
nnoremap <unique><silent>"MP :BookmarkPrev<CR>
nnoremap <unique><silent>"MC :BookmarkClear<CR>
nnoremap <unique><silent>"MX :BookmarkClearAll<CR>
nnoremap <unique><silent>"MU :BookmarkMoveUp<CR>
nnoremap <unique><silent>"MD :BookmarkMoveDown<CR>

let g:vim_bookmarks_init = 1
