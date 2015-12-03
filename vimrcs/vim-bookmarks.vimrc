PluginAdd 'MattesGroeger/vim-bookmarks'

let g:bookmark_sign            = ">"
let g:bookmark_annotation_sign = "$"

let g:bookmark_no_default_key_mappings = 1

nnoremap <leader>mm :BookmarkToggle<CR>
nnoremap <leader>mi :BookmarkAnnotate<CR>
nnoremap <leader>ma :BookmarkShowAll<CR>
nnoremap <leader>mj :BookmarkNext<CR>
nnoremap <leader>mk :BookmarkPrev<CR>
nnoremap <leader>mc :BookmarkClear<CR>
nnoremap <leader>mx :BookmarkClearAll<CR>
nnoremap <leader>mu :BookmarkMoveUp<CR>
nnoremap <leader>md :BookmarkMoveDown<CR>

