PluginAdd 'MattesGroeger/vim-bookmarks'

let g:bookmark_sign            = ">"
let g:bookmark_annotation_sign = "$"

let g:bookmark_no_default_key_mappings = 1

if !exists("g:vim_bookmarks_map")
    let g:vim_bookmarks_map = 1
    nnoremap <unique> <silent> <leader>mm :BookmarkToggle<CR>
    nnoremap <unique> <silent> <leader>mi :BookmarkAnnotate<CR>
    nnoremap <unique> <silent> <leader>ma :BookmarkShowAll<CR>
    nnoremap <unique> <silent> <leader>mj :BookmarkNext<CR>
    nnoremap <unique> <silent> <leader>mk :BookmarkPrev<CR>
    nnoremap <unique> <silent> <leader>mc :BookmarkClear<CR>
    nnoremap <unique> <silent> <leader>mx :BookmarkClearAll<CR>
    nnoremap <unique> <silent> <leader>mu :BookmarkMoveUp<CR>
    nnoremap <unique> <silent> <leader>md :BookmarkMoveDown<CR>
endif
