" supertab
if !exists("g:use_supertab") || g:use_supertab == 0
    finish
end

PluginAdd 'ervandew/supertab'

let g:SuperTabDefaultCompletionType 	= "context"
"let g:SuperTabDefaultCompletionType 	= "<c-x><c-o>"

autocmd FileType *
  \ if &omnifunc != '' |
  \   call SuperTabChain(&omnifunc, "<c-p>") |
  \   call SuperTabSetDefaultCompletionType("<c-x><c-u>") |
  \ endif

