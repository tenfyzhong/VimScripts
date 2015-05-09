" supertab
if !exists("g:use_supertab") || g:use_supertab == 0
    finish
end

" 防止重得加载
if exists("g:has_load_supertab") && g:has_load_supertab == 1
    finish
end
let g:has_load_supertab = 1

PluginAdd 'ervandew/supertab'

let g:SuperTabDefaultCompletionType 	= "context"
"let g:SuperTabDefaultCompletionType 	= "<c-x><c-o>"

autocmd FileType *
  \ if &omnifunc != '' |
  \   call SuperTabChain(&omnifunc, "<c-p>") |
  \   call SuperTabSetDefaultCompletionType("<c-x><c-u>") |
  \ endif

