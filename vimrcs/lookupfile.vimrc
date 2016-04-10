"==============================================================
"    file: lookupfile.vimrc
"   brief: 通过tag来查找文件
" VIM Version: 7.4
"  author: tenfyzhong
"   email: 364755805@qq.com
" created: 2016-04-09 23:17:32
"==============================================================
PluginAdd 'vim-scripts/lookupfile'
PluginAdd 'clones/vim-genutils'

let g:LookupFile_MinPatLength = 1
let g:LookupFile_PreserveLastPattern = 0
let g:LookupFile_PreservePatternHistory = 0 
let g:LookupFile_AlwaysAcceptFirst = 1
let g:LookupFile_AllowNewFiles = 0
let g:LookupFile_SearchForBufsInTabs = 1
let g:LookupFile_EscCancelsPopup = 0
let g:LookupFile_FileFilter = '\.class$\|\.o$\|\.obj$\|\.exe$\|\.jar$\|\.zip$\|\.a$\|\.d$\|\.out$'



if !exists("g:lookupfile_vimrc")
    nmap     <unique><silent><leader>uf <Plug>LookupFile
    nnoremap <unique><silent><leader>ut :LUTags<cr>
    nnoremap <unique><silent><leader>ub :LUBufs<cr>
    nnoremap <unique><silent><leader>uw :LUWalk<cr>
endif

let s:lookupfile_tags = file#FindFile(getcwd(), ".lookupfile_tags")
if s:lookupfile_tags != ''
    exec "let g:LookupFile_TagExpr = \"'" . s:lookupfile_tags . "/.lookupfile_tags'\""
endif

let g:lookupfile_vimrc = 1
