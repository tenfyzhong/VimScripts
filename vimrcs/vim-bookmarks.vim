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
"          BookmarkProjectLoad 加载工程下的书签
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
"   email: tenfyzhong@qq.com
" created: 2016-04-15 20:28:14
"==============================================================
PluginAdd 'MattesGroeger/vim-bookmarks'

let g:bookmark_sign            = ">"
let g:bookmark_annotation_sign = "$"
let g:bookmark_no_default_key_mappings = 1
let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save = 1

" Finds the Git super-project directory.
function! g:BMWorkDirFileLocation()
    let path = file#GetGitHome()
    let result = ''
    if path != ''
        let result = file#Join(path, '.git', 'bookmarks')
    else
        let result = file#Join(path, '.bookmarks')
    endif
    let result = file#Absolute(result)
    return result
endfunction


if exists("g:vim_bookmarks_init")
    finish
endif

nnoremap <silent>Mm :BookmarkToggle<CR>
nnoremap <silent>Ma :BookmarkAnnotate<CR>
nnoremap <silent>Ms :BookmarkShowAll<CR>
nnoremap <silent>Mn :BookmarkNext<CR>
nnoremap <silent>Mp :BookmarkPrev<CR>
nnoremap <silent>Mc :BookmarkClear<CR>
nnoremap <silent>Mx :BookmarkClearAll<CR>
nnoremap <silent>Mu :BookmarkMoveUp<CR>
nnoremap <silent>Md :BookmarkMoveDown<CR>

let g:vim_bookmarks_init = 1

