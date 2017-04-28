"==============================================================
"    file: vcscommand.vim.vimrc
"   brief: 提供ex命令来操作vcs
" 
" command: VCSAdd 将当前文件添加到VCS,不会提交,参数会透传给VCS
"          VCSAnnotate[!] 显示当前文件每行的注释,参数是版本号,没有参数时是最近的提交,!分屏
"          VCSBlame[!] Alias VCSAnnotate
"          VCSCommit[!] 提交到vcs,参数是log信息,叹号强制提交空log信息的记录
"          VCSDelete 从vcs中删除当前文件,参数会透传给vcs
"          VCSDiff diff比较当前文件提交,没有参数时比较当文件和父提交,一个参数时比较当前文件和参数版本号,两个版本号参数时,比较对应两个版本的提交
"          VCSGotoOriginal[!] jumps to the source buffer if the current buffer is a VCS scratch buffer.
"          VCSLog 显示当前文件的提交历史log,如果提供一个参数,它会当成版本号传给vcs,多于一个参数会将所有的参数传给vcs
"          VCSRemove Alias for VCSDelete
"          VCSRevert 使用最近的版本替换掉当前的修改
"          VCSReview 显示一个特定版本的内容,如果没有参数,会显示最近版本的
"          VCSStatus 显示当前文件的状态,参数会透传给vcs
"          VCSUpdate 更新远程版本库下来
"          VCSVimDiff 类似于VCSDiff,但是使用vimdiff
"          VCSInfo 显示当前文件的info信息
"          VCSLock 锁定当前文件避免其他人同时修改这个文件
"          VCSUnLock 解锁VCSLock的锁定，参数会透传
"
" CVS特有的command:CVSEdit,CVSEditors,CVSUnedit,CVSWatch,CVSWatchAdd,CVSWatchOn
"                  CVSWatchOff,CVSWatchRemove,CVSWatchers
"
"        nmap: 以下map执行不传参数的command
"              <Leader>ca VCSAdd
"              <Leader>cn VCSAnnotate
"              <Leader>cN VCSAnnotate!
"              <Leader>cc VCSCommit
"              <Leader>cD VCSDelete
"              <Leader>cd VCSDiff
"              <Leader>cg VCSGotoOriginal
"              <Leader>cG VCSGotoOriginal!
"              <Leader>ci VCSInfo
"              <Leader>cl VCSLog
"              <Leader>cL VCSLock
"              <Leader>cr VCSReview
"              <Leader>cs VCSStatus
"              <Leader>cu VCSUpdate
"              <Leader>cU VCSUnlock
"              <Leader>cv VCSVimDiff
"
" VIM Version: 7.4
"  author: tenfyzhong
"   email: tenfyzhong@qq.com
" created: 2016-04-15 13:53:33
"==============================================================
PluginAdd 'vcscommand.vim'

augroup VCSCommand
    autocmd!
    au User VCSBufferCreated call <SID>BufferCreate()
augroup END

function! s:BufferCreate()
    silent! nnoremap <buffer> q :bwipeout<cr>
    if bufname('%') =~? '.*commitlog.*'
        :startinsert
    endif
endfunction
