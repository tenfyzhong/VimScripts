"==============================================================
"    file: vim-table-mode.vim
"   brief: 
" command:
"           :TableModeToggle 触发表格模式
"           :TableModeEnable 开启表格模式
"           :TableModeDisable 关闭表格模式
"           :Tablize 格式成表格
"           :TableModeRealign 表格重排
"           :TableAddFormula 增加formula
"           :TableEvalFormulaLine 计算formula
"           :TableSort[!] [i][u][r][n][x][o] 排序
"
"
"    nmap: <leader>t prefix
"          <leader>tm 触发table mode
"          <leader>tt tableize格式化选择行
"          <leader>T tableize格式化选择行，让用户选择分隔符
"          <leader>tr 重新对齐表格
"          <leader>t? 重新输出定义的formulas
"          [|         移到前一个单元格
"          ]|         移到后一个单元格
"          {|         移到上一个单元格
"          }|         移到下一个单元格
"          <leader>tdd 删除行
"          <leader>tdc 删除列
"          <leader>tfa 请求一个fomula给当前单元格
"          <leader>tfe 
"          <leader>ts  排序
"
"   imap: | 在table mode下触发创建表格
"         || 扩展表格头
" VIM Version: 7.4
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2016-06-30 14:18:42
"==============================================================
PluginAdd 'dhruvasagar/vim-table-mode'

let g:table_mode_corner='|'

function! TableModeStatusLine()
    if exists(':TableModeToggle')
        return tablemode#IsActive() ? 'TM' : ''
    endif
endfunction

set statusline+=%!TableModeStatusLine()
