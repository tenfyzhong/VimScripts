"==============================================================
"    file: quickfix.vimrc
"   brief: 
"
"    nmap: <leader>qk 跳到上一个quickfix或者loclist的内容
"          <leader>qj 跳到下一个quickfix或者loclist的内容
"          <leader>qc 关闭quickfix或者loclist
"          <leader>qo 打开quickfix或者loclist
"          <leader>qq 打开quickfix
"          <leader>ql 打开loclist
"
" quickfix的nmap
"     q: cclose
" VIM Version: 7.4
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2016-04-13 20:24:38
"==============================================================
" quickfix
if !has("quickfix")
    finish
endif

nnoremap <silent><leader>qk :call feature#QuickfixDo('previous')<cr>
nnoremap <silent><leader>qj :call feature#QuickfixDo('next')<cr>
nnoremap <silent><leader>qc :call feature#QuickfixDo('close')<cr>
nnoremap <silent><leader>qo :call feature#QuickfixOpen()<cr>
nnoremap <silent><leader>qq :silent botright copen<cr>
nnoremap <silent><leader>ql :silent botright lopen<cr>

