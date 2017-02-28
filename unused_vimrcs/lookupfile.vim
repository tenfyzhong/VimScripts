"==============================================================
"    file: lookupfile.vimrc
"   brief: 通过tag来查找文件
"
" command: LUTags 通过tag文件中查找文件
"          LUPath 在'path'中查找文件
"          LUBufs 在buffers中查找文件
"          LUWalk 一层层的去查找文件
"          LUArgs 在:args中去查找文件
"          LookupFile 上一次执行的命令
"
"    nmap:
"
" lookupfile下的map
"    nmap: <Esc><Esc> 退出lookupfile窗口
"    imap: <Esc><Esc> 退出lookupfile窗口
"          <c-j> 下一个文件
"          <c-k> 上一个文件
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
let g:LookupFile_FileFilter = ''



if !exists("g:lookupfile_vimrc")
    nmap     <silent><leader>uf <Plug>LookupFile
    nnoremap <silent><leader>ut :LUTags<cr>
    nnoremap <silent><leader>ub :LUBufs<cr>
    nnoremap <silent><leader>uw :LUWalk<cr>
endif

let s:lookupfile_tags = file#FindFile(getcwd(), ".lookupfile_tags")
if s:lookupfile_tags != ''
    exec "let g:LookupFile_TagExpr = \"'" . s:lookupfile_tags . ".lookupfile_tags'\""
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
        let l:guest_root = file#GuessProjectRoot(l:pwd)
        if l:guest_root != ''
            let l:root = l:guest_root
        else
            let l:root = l:pwd
        endif
    endif
    call system("~/.vim/bin/unix/lookupfile.sh " . l:root)
    echo "Wow! Create .lookupfile_tags file success!"
    if l:pwd == getcwd() 
        exec "let g:LookupFile_TagExpr = \"'" . l:root . "/.lookupfile_tags'\""
    endif
endfunction

let g:lookupfile_vimrc = 1

