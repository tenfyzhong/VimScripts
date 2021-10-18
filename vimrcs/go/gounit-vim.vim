"==============================================================
"    file: gounit-vim.vim
"   brief: 生成单元测试
"
" command: GoUnit                       生成当前行的函数测试
"          GoUnitTemplateAdd /file/name 把文件添加到模板
"          GoUnitTemplateDel template   删除模板
"          GoUnitTemplateList           列出所有模板
"          GoUnitTemplateUse template   设置默认模板
"
"    nmap:
"      <leader>rtg GoUnit
" VIM Version: 8.0
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2019-11-23 09:31:45
"==============================================================
Plug 'hexdigest/gounit-vim', {'do': ':call GoUnitLocalInit()'}

function! GoUnitLocalInit()
  GoUnitInstallBinaries
  GoUnitTemplateAdd ~/.vim/resource/gounit/gomock
endfunction

augroup gounit_vim_local
  au!
  au FileType go nnoremap <buffer><leader>rtg :normal vaf<cr>:GoUnit<cr>
augroup end
