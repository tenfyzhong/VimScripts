" supertab
let g:SuperTabDefaultCompletionType 	= "context"
"let g:SuperTabDefaultCompletionType 	= "<c-x><c-o>"

autocmd FileType *
  \ if &omnifunc != '' |
  \   call SuperTabChain(&omnifunc, "<c-p>") |
  \   call SuperTabSetDefaultCompletionType("<c-x><c-u>") |
  \ endif
