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
"    nmap: Mm :BookmarkToggle
"          Ma :BookmarkAnnotate
"          Ms :BookmarkShowAll
"          Mn :BookmarkNext
"          Mp :BookmarkPrev
"          Mc :BookmarkClear
"          Mu :BookmarkMoveUp
"          Md :BookmarkMoveDown
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

nnoremap <unique><silent>Mm :BookmarkToggle<CR>
nnoremap <unique><silent>Ma :BookmarkAnnotate<CR>
nnoremap <unique><silent>Ms :BookmarkShowAll<CR>
nnoremap <unique><silent>Mn :BookmarkNext<CR>
nnoremap <unique><silent>Mp :BookmarkPrev<CR>
nnoremap <unique><silent>Mc :BookmarkClear<CR>
nnoremap <unique><silent>Mx :BookmarkClearAll<CR>
nnoremap <unique><silent>Mu :BookmarkMoveUp<CR>
nnoremap <unique><silent>Md :BookmarkMoveDown<CR>

let g:vim_bookmarks_init = 1
