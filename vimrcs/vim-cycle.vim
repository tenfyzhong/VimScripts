"==============================================================
"    file: vim-cycle.vim
"   brief: 循环切换列表
"
"    nmap:  <tab>a 下一项
"           <tab>x 上一项
" VIM Version: 8.0
"  author: zhongtenghui
"   email: zhongtenghui@gf.com.cn
" created: 2017-08-29 13:56:20
"==============================================================

PluginAdd 'tenfyzhong/vim-cycle'

let g:cycle_phased_search = 0
let g:cycle_no_mappings = 1
nmap <silent> <tab>a <Plug>CycleNext
nmap <silent> <tab>x <Plug>CyclePrev

let g:cycle_default_groups = [
            \ [['&&', '||']],
            \ [['&', '|', '^']],
            \ [['&=', '|=', '^=']],
            \ [['>>', '<<']],
            \ [['>>=', '<<=']],
            \ [['==', '!=']],
            \ [['>', '<', '>=', '<=']],
            \ [['{:}', '[:]', '(:)'], 'sub_pairs'],
            \ [['（:）', '「:」', '『:』'], 'sub_pairs'],
            \ [['true', 'false'], 'match_word'],
            \ [['yes', 'no'], 'match_word'],
            \ [['on', 'off'], 'match_word'],
            \ [['and', 'or'], 'match_word'],
            \ [["up", "down"], 'match_word'],
            \ [["min", "max"], 'match_word'],
            \ [["get", "set"], 'match_word'],
            \ [["add", "remove"], 'match_word'],
            \ [["to", "from"], 'match_word'],
            \ [["read", "write"], 'match_word'],
            \ [["only", "except"], 'match_word'],
            \ [['without', 'with'], 'match_word'],
            \ [["exclude", "include"], 'match_word'],
            \ [["asc", "desc"], 'match_word'],
            \ [['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday',
            \   'Friday', 'Saturday'], 'match_word', {'name': 'Days'}],
            \ [['January', 'February', 'March', 'April', 'May', 'June', 'July',
            \   'August', 'September', 'October', 'November', 'December'],
            \  'match_word', {'name': 'Months'}],
            \ [["in", "out"], 'match_word'],
            \ [['verbose', 'debug', 'info', 'warn', 'error', 'fatal'], 
            \  'match_word', {'name': 'Logs'}],
            \ ]

let g:cycle_default_groups_for_c = [
            \  [['#if', '#elif', '#else', '#endif']],
            \  [['#ifdef', '#ifndef']],
            \ ]

let g:cycle_default_groups_for_cpp = [
            \ [['private', 'protected', 'public'], 'match_word'],
            \ [['class', 'struct'], 'match_word'],
            \ ] + g:cycle_default_groups_for_c

let g:cycle_default_groups_for_python = [
            \ [['if', 'elif', 'else'], 'match_word'],
            \ ]

let g:cycle_default_groups_for_go = [
            \ [['byte', 'rune'], 'match_word'],
            \ [['complex64', 'complex128'], 'match_word'],
            \ [['int', 'int8', 'int16', 'int32', 'int64'], 'match_word'],
            \ [['uint', 'uint8', 'uint16', 'uint32', 'uint64'], 'match_word'],
            \ [['float32', 'float64'], 'match_word'],
            \ [['interface', 'struct'], 'match_word'],
            \ ]

let g:cycle_default_groups_for_html = [
            \   [['h1', 'h2', 'h3', 'h4', 'h5', 'h6'], 'sub_tag', 'match_word'],
            \   [['ul', 'ol'], 'sub_tag', 'match_word'],
            \   [['em', 'strong', 'small'], 'sub_tag', 'match_word'],
            \ ]

let g:cycle_default_groups_for_css = [
            \   [["none", "block"], 'match_word'],
            \   [["show", "hide"], 'match_word'],
            \   [["left", "right"], 'match_word'],
            \   [["top", "bottom"], 'match_word'],
            \   [["margin", "padding"], 'match_word'],
            \   [["before", "after"], 'match_word'],
            \   [["absolute", "relative"], 'match_word'],
            \   [["first", "last"], 'match_word'],
            \ ]
