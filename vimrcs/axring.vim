"==============================================================
"    file: axring.vim
"   brief: 
" VIM Version: 8.0
"  author: tenfy
"   email: tenfy@tenfy.cn
" created: 2017-08-30 08:57:39
"==============================================================
PluginAdd 'tenfyzhong/axring.vim', {'frozen': 1}

let g:axring_rings = [
      \ ['&&', '||'],
      \ ['&', '|', '^'],
      \ ['&=', '|=', '^='],
      \ ['>>', '<<'],
      \ ['>>=', '<<='],
      \ ['==', '!='],
      \ ['>', '<', '>=', '<='],
      \ ['++', '--'],
      \ ['true', 'false'],
      \ ['yes', 'no'],
      \ ['on', 'off'],
      \ ['and', 'or'],
      \ ["up", "down"],
      \ ["min", "max"],
      \ ["get", "set"],
      \ ["add", "remove"],
      \ ["to", "from"],
      \ ["read", "write"],
      \ ["only", "except"],
      \ ['without', 'with'],
      \ ["exclude", "include"],
      \ ["asc", "desc"],
      \ ['sunday', 'monday', 'tuesday', 'wednesday', 'thursday',
      \   'friday', 'saturday'],
      \ ['january', 'february', 'march', 'april', 'may', 'june', 'july',
      \   'august', 'september', 'october', 'november', 'december'],
      \ ["in", "out"],
      \ ['verbose', 'debug', 'info', 'warn', 'error', 'fatal'], 
      \ ['long', 'short'], 
      \ ]

let g:axring_rings_c = [
      \ ['if', 'else'],
      \ ['ifdef', 'ifndef'],
      \ ['uint8_t', 'uint16_t', 'uint32_t', 'uint64_t'],
      \ ['int8_t', 'int16_t', 'int32_t', 'int64_t'],
      \ ]

let g:axring_rings_cpp = [
      \ ['private', 'protected', 'public'],
      \ ['class', 'struct'],
      \ ] + g:axring_rings_c

let g:axring_rings_python = [
      \ ['if', 'elif', 'else'],
      \ ]

let g:axring_rings_go = [
      \ [':=', '='],
      \ ['byte', 'rune'],
      \ ['complex64', 'complex128'],
      \ ['int', 'int8', 'int16', 'int32', 'int64'],
      \ ['uint', 'uint8', 'uint16', 'uint32', 'uint64'],
      \ ['float32', 'float64'],
      \ ['interface', 'struct'],
      \ ]

let g:axring_rings_vim = [
      \ ['if', 'elseif', 'else', 'endif'],
      \ ]

let g:axring_rings_vader = [
      \ ['Given', 'Do', 'Execute', 'Then', 'Expect'],
      \ ['Before', 'After'],
      \ ]

let g:axring_rings_sh = [
      \ ['if', 'elif', 'else', 'fi'],
      \ ]

let g:axring_rings_css = [
      \   ["none", "block"],
      \   ["show", "hide"],
      \   ["left", "right"],
      \   ["top", "bottom"],
      \   ["margin", "padding"],
      \   ["before", "after"],
      \   ["absolute", "relative"],
      \   ["first", "last"],
      \ ]

let g:axring_rings_gitrebase = [
      \   ['p', 'r', 'e', 's', 'f', 'x', 'd'],
      \   ['pick', 'reword', 'edit', 'squash', 'fixup', 'exec', 'drop'],
      \ ]

