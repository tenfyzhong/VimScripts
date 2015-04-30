"  cscope
finish
PluginAdd 'tenfyzhong/cscope.vim'

let g:cscope_files = '\.c$\|\.cpp$\|\.h$\|\.hpp$\|\.jce$\|\.ini$'
let g:cscope_ignore_custom='\.py$\|\.java$\|\.log$\|\.txt$\|\.sh$\|\.js$\|\.pl$\|\.PL$'

nnoremap <leader>cg :CsGen<CR>

nnoremap <C-\>s :call CscopeFind('s', expand('<cword>'))<CR>
nnoremap <C-\>g :call CscopeFind('g', expand('<cword>'))<CR>
nnoremap <C-\>c :call CscopeFind('c', expand('<cword>'))<CR>
nnoremap <C-\>t :call CscopeFind('t', expand('<cword>'))<CR>
nnoremap <C-\>e :call CscopeFind('e', expand('<cword>'))<CR>
nnoremap <C-\>f :call CscopeFind('f', expand('<cword>'))<CR>
nnoremap <C-\>i :call CscopeFind('i', expand('<cword>'))<CR>
nnoremap <C-\>d :call CscopeFind('d', expand('<cword>'))<CR>

nnoremap <C-@>s :call ScscopeFind('s', expand('<cword>'))<CR>
nnoremap <C-@>g :call ScscopeFind('g', expand('<cword>'))<CR>
nnoremap <C-@>c :call ScscopeFind('c', expand('<cword>'))<CR>
nnoremap <C-@>t :call ScscopeFind('t', expand('<cword>'))<CR>
nnoremap <C-@>e :call ScscopeFind('e', expand('<cword>'))<CR>
nnoremap <C-@>f :call ScscopeFind('f', expand('<cword>'))<CR>
nnoremap <C-@>i :call ScscopeFind('i', expand('<cword>'))<CR>
nnoremap <C-@>d :call ScscopeFind('d', expand('<cword>'))<CR>

nnoremap <C-@><C-@>s :call VcscopeFind('s', expand('<cword>'))<CR>
nnoremap <C-@><C-@>g :call VcscopeFind('g', expand('<cword>'))<CR>
nnoremap <C-@><C-@>c :call VcscopeFind('c', expand('<cword>'))<CR>
nnoremap <C-@><C-@>t :call VcscopeFind('t', expand('<cword>'))<CR>
nnoremap <C-@><C-@>e :call VcscopeFind('e', expand('<cword>'))<CR>
nnoremap <C-@><C-@>f :call VcscopeFind('f', expand('<cword>'))<CR>
nnoremap <C-@><C-@>i :call VcscopeFind('i', expand('<cword>'))<CR>
nnoremap <C-@><C-@>d :call VcscopeFind('d', expand('<cword>'))<CR>

