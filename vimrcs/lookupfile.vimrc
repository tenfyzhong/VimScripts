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
let g:LookupFile_FileFilter = '\.class$\|\.o$\|\.obj$\|\.exe$\|\.jar$\|\.zip$\|\.a$\|\.so$\|\.d$\|\.out$\|\.bak$\|\.swp$\|^\.ycm_extra_conf.py$\|\.doc$\|\.docx$\|\.xls$\|\.xlsx$\|^\.NERDTreeBookmarks$\|\.tgz$\|\.tar\.gz$\|\.Plo$\|\.Po$\|\.d\.\d\d*$\|\.dblite$\|\.dirstamp$'



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

" 如果使用<bang>会在当前目录去生成.lookupfile_tags文件，而不会去查找工程目录
com! -bang -nargs=? -complete=dir LookupGenTag call <SID>GenerateFileTag("<bang>", <q-args>)

function! s:GenerateFileTag(bang, ...)
    if a:0 && a:1 != ''
        let l:pwd = a:1
    else
        let l:pwd = getcwd()
    endif
    if a:bang == "!"
        let l:root = l:pwd
    else
        let l:root = file#GuessProjectRoot(l:pwd)
    endif
    call system("~/.vim/bin/unix/lookupfile.sh " . l:root)
    echo "Wow! Create .lookupfile_tags file success!"
    if l:pwd == getcwd() 
        exec "let g:LookupFile_TagExpr = \"'" . l:root . "/.lookupfile_tags'\""
    endif
endfunction

let g:lookupfile_vimrc = 1

