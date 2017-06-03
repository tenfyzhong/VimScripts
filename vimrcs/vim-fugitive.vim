"==============================================================
"    file: vim-fugitive.vimrc
"   brief: 运行git命令
"
" command: 
"     Git! [args] 运行git命令,先cd到版本库的根目录,再执行!git [args],叹号会将输入放到一个临时buffer中
"     Gcd [directory] cd到版本库的相对目录
"     Glcd [directory] lcd到版本库的相对目录
"     Gstatus 显示当前版本库的状态
"     Gcommit [args] 提交修改,没有内容提交时会执行Gstatus
"     Gmerge [args] 合并
"     Gpull [args] git pull
"     Gpush [args] git push
"     Gfetch [args] git fetch
"     Ggrep [args] git-grep
"     Glgrep [args] git-grep
"     {range}Glog [args] git log
"     Gllog [args] like Glog
"     Gedit [revision] :edit a fugitive-revision
"     Gsplit! [revision] :split a fugitive-revison
"     Gvsplit! [revision] :vsplit a fugitive-revison
"     Gtabedit! [revision] :tabedit a fugitive-revison
"     Gpedit! [revision] :pedit a fugitive-revison
"     {range}Gread [revision] 读入一个revision到一个新buffer，保留range的内容
"     {range}Gread! [args] 清空buffer，将args命令的内容写到buffer，保留range的内容
"     Gwrite {path} 将文件写入path
"     Gwq[!] [path] 类似于Gwrite!,写成功的话就执行:quit[!]命令
"     Gdiff [revision] 使用vimdiff与一个revision的内容做比较，不给revision就用index的内容做比较
"     Gsdiff [revision] 类似于Gdiff，但是总是split
"     Gvdiff [revision] 类似于Gdiff，但是总是vertical split
"     Gmove[!] {destination} git mv，!相当于传参数-f
"     Gremove[!] 删除当前buffer,如果是在index中的文件,--cached会传过去,!会传入-f
"     {range}Gblame [flags] 运行git-blame,flags可以是ltfnsewMC,传给git-blame,range会作用于特定范围
"     Gbrowse {revision} 打开当前file,blob,tree,commit,tag的上流
"     Gbrowse [...]@{remote} 强制使用给定的remote
"     {range}Gbrowse[!] [args] 
"
"    nmap: <leader>gw Gwrite
"          <leader>gc Gcommit
"          <leader>gb Gblame
"          <leader>gd Gvdiff
"          <leader>gl Glog
"          <leader>gs Gstatus
"
"    cmap: <c-r><c-g> 在命令行中返回当前文件
"          ["x]y<c-g> 粘贴当前对象的提交sha值
"    在git object下的map
"    nmap:
"      <CR> Jump to the revision under the cursor.
"      o    Jump to the revision under the cursor in a new split.
"      S    Jump to the revision under the cursor in a new vertical split.
"      O    Jump to the revision under the cursor in a new tab.
"      -    Go to the tree containing the current tree or blob.
"      ~    Go to the current file in the [count]th first ancestor.
"      P    Go to the current file in the [count]th parent.
"      C    Go to the commit containing the current file.
"      .    Start a : command line with the current revision prepopulated at the end of the line.
"      a    Show the current tag, commit, or tree in an alternate format.
" VIM Version: 7.4
"  author: tenfyzhong
"   email: tenfyzhong@qq.com
" created: 2016-04-15 15:39:29
"==============================================================
PluginAdd 'tpope/vim-fugitive'

augroup fugitive_init
    autocmd! 
    autocmd FileType gitcommit cabbrev <buffer> x silent x
    autocmd FileType gitcommit cabbrev <buffer> q silent q
    autocmd BufRead,BufNew COMMIT_EDITMSG call <SID>set_commit_edit_msg_cursor()
    autocmd QuickFixCmdPost *grep* cwindow
augroup END

function! s:set_commit_edit_msg_cursor()
    let lnum = 1
    let last_lnum = line('$')
    while lnum <= last_lnum
        let content = getline(lnum)
        if content =~# '^#'
            let lnum += 1
        else
            break
        endif
    endwhile
    call cursor(lnum, 1)
endfunction

nnoremap <silent><leader>gw :Gwrite<cr>
nnoremap <silent><leader>gc :Gcommit<cr>
nnoremap <silent><leader>gb :Gblame<cr>
nnoremap <silent><leader>gd :Gvdiff<cr>
nnoremap <silent><leader>gl :silent Glog!<cr>
nnoremap <silent><leader>gs :Gstatus<cr>

