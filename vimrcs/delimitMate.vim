"==============================================================
"    file: delimitMate.vimrc
"   brief: 自动补全右括号引号等
" VIM Version: 7.4
"
" command: :DelimitMateReload 重设所有的map
"          :DelimitMateOn enable DelimitMate mappings
"          :DelimitMateOff disable DelimitMate mappings
"          :DelimitMateSwitch switches DelimitMate on and off
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2016-04-13 14:07:04
"==============================================================
PluginAdd 'Raimondi/delimitMate'

let g:delimitMate_expand_cr = 2
let g:delimitMate_balance_matchpairs = 1
augroup delimitMate_setting
    autocmd!
    au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
    au FileType markdown let b:delimitMate_nesting_quotes = ['`']
augroup END
