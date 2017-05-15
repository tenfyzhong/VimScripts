"==============================================================
"    file: ale.vimrc
"   brief: 异步语法检查
"
" command: ALELint 进行检查
"          ALEPrevious 上一个错误或警告,不循环
"          ALEPreviousWrap 上一个错误或警告,循环
"          ALENext 下一个错误或警告,不循环
"          ALENextWrap 下一个错误或警告,循环
"          ALEToggle 触发启用ale
"          ALEEnable 启用ale
"          ALEDisable 禁用ale
"          ALEDetail 显示完整的错误信息在底行
"
"    nmap: <leader>al ALELint
"          <leader>ad ALEDetail
"          <leader>at ALEToggle
"          <leader>aj ALENextWrap
"          <leader>ak ALEPreviousWrap
" VIM Version: 7.4
"  author: tenfyzhong
"   email: tenfyzhong@qq.com
" created: 2017-02-08 12:52:47
"==============================================================
if version < 800
    finish
endif
PluginAdd 'w0rp/ale'

let g:ale_cpp_gcc_options = '-std=c++11 -Wall'

let g:ale_linters = {
            \ 'c': [], 
            \ 'cpp': [],
            \}

" 关闭pymode的检查
let g:pymode_lint = 0

nmap <silent><leader>al <Plug>(ale_lint)
nmap <silent><leader>ad <Plug>(ale_detail)
nmap <silent><leader>at <Plug>(ale_toggle)
nmap <silent><leader>aj <Plug>(ale_next_wrap)
nmap <silent><leader>ak <Plug>(ale_previous_wrap)
