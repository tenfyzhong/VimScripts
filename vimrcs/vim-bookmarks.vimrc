PluginAdd 'MattesGroeger/vim-bookmarks'

let g:bookmark_sign            = ">"
let g:bookmark_annotation_sign = "$"

let g:bookmark_no_default_key_mappings = 1

if !exists("g:vim_bookmarks_map")
    let g:vim_bookmarks_map = 1
    nnoremap <unique><silent>MM :BookmarkToggle<CR>
    nnoremap <unique><silent>MI :BookmarkAnnotate<CR>
    nnoremap <unique><silent>MA :BookmarkShowAll<CR>
    nnoremap <unique><silent>MJ :BookmarkNext<CR>
    nnoremap <unique><silent>MK :BookmarkPrev<CR>
    nnoremap <unique><silent>MC :BookmarkClear<CR>
    nnoremap <unique><silent>MX :BookmarkClearAll<CR>
    nnoremap <unique><silent>MU :BookmarkMoveUp<CR>
    nnoremap <unique><silent>MD :BookmarkMoveDown<CR>
endif
