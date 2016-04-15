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
"   email: 364755805@qq.com
" created: 2016-04-15 20:28:14
"==============================================================
PluginAdd 'MattesGroeger/vim-bookmarks'

let g:bookmark_sign            = ">"
let g:bookmark_annotation_sign = "$"
let g:bookmark_no_default_key_mappings = 1
" let g:bookmark_save_per_working_dir = 1
let g:bookmark_save_per_project_dir = 1

augroup bookmark_init
    au! 
    autocmd VimLeave * call <SID>SaveOnProjectRoot()
augroup END

function! s:SaveOnProjectRoot() " {{{
    if !exists("g:bookmark_save_per_project_dir") || 
                \g:bookmark_save_per_project_dir == 0
        return
    endif

    let l:pwd = getcwd()
    let l:root = file#GuessProjectRoot(l:pwd)
    " 如果不存在项目，直接返回
    if l:root == ''
        return
    endif

    " 如果根目录是当前目录，且设置了g:bookmark_save_per_working_dir，直接返回
    if l:root == l:pwd && 
                \exists("g:bookmark_save_per_working_dir") && 
                \g:bookmark_save_per_working_dir
        return
    endif

    let l:file = <SID>consBookmarkFile(l:root)
    call BookmarkSave(l:file, 0)
endfunction " }}}

function! s:LoadProjectRootBookmark() " {{{
    let l:pwd = getcwd()
    let l:root = file#GuessProjectRoot(l:pwd)
    if l:root == ''
        return
    endif
    let l:file = <SID>consBookmarkFile(l:root)
    call BookmarkLoad(l:file, 0, 0)
endfunction " }}}

function! s:consBookmarkFile(path) " {{{
    return expand(a:path . '/.vim-bookmarks')
endfunction " }}}

command! -nargs=0 BookmarkProjectLoad call <SID>LoadProjectRootBookmark()

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

