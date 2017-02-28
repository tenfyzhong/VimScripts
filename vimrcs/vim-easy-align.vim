"==============================================================
"    file: vim-easy-align.vimrc
"   brief: 对齐插件
"   预定制的key: =:.|&#,
" --------------+--------------------------------------------------------------------
" Delimiter key | Description/Use cases                                              
" --------------+--------------------------------------------------------------------
" <Space>       | General alignment around whitespaces
"  `=`            | Operators containing equals sign ( `=` ,  `==,`  `!=` ,  `+=` ,  `&&=` , ...)
"  `:`            | Suitable for formatting JSON or YAML
"  `.`            | Multi-line method chaining
"  `,`            | Multi-line method arguments
"  `&`            | LaTeX tables (matches  `&`  and  `\\` )
"  `#`            | Ruby/Python comments
"  `"`            | Vim comments
" <Bar>         | Table markdown
" --------------+--------------------------------------------------------------------
"
"  交互模式的快捷键
" --------+--------------------+---------------------------------------------------
" Key     | Option             | Values                                            
" --------+--------------------+---------------------------------------------------
" CTRL-F  |  `filter`            | Input string ( `[gv]/.*/?` )
" CTRL-I  |  `indentation`       | shallow, deep, none, keep
" CTRL-L  |  `left_margin`       | Input number or string
" CTRL-R  |  `right_margin`      | Input number or string
" CTRL-D  |  `delimiter_align`   | left, center, right
" CTRL-U  |  `ignore_unmatched`  | 0, 1
" CTRL-G  |  `ignore_groups`     | [], ["String'], ["Comment'], ["String', "Comment']
" CTRL-A  |  `align`             | Input string ( `/[lrc]+\*{0,2}/` )
" <Left>  |  `stick_to_left`     |  `{ 'stick_to_left': 1, 'left_margin': 0 }`
" <Right> |  `stick_to_left`     |  `{ 'stick_to_left': 0, 'left_margin': 1 }`
" <Down>  |  `*_margin`          |  `{ 'left_margin': 0, 'right_margin': 0 }`
" --------+--------------------+---------------------------------------------------
"
"  option值
" -------------------+---------+-----------------------+--------------------------------------------------------
" Option             | Type    | Default               | Description                                            
" -------------------+---------+-----------------------+--------------------------------------------------------
"  `filter`            | string  |                       | Line filtering expression:  `g/../`  or  `v/../`
"  `left_margin`       | number  | 1                     | Number of spaces to attach before delimiter
"  `left_margin`       | string  |  `' '`                  | String to attach before delimiter
"  `right_margin`      | number  | 1                     | Number of spaces to attach after delimiter
"  `right_margin`      | string  |  `' '`                  | String to attach after delimiter
"  `stick_to_left`     | boolean | 0                     | Whether to position delimiter on the left-side
"  `ignore_groups`     | list    | ["String', "Comment'] | Delimiters in these syntax highlight groups are ignored
"  `ignore_unmatched`  | boolean | 1                     | Whether to ignore lines without matching delimiter
"  `indentation`       | string  |  `k`                    | Indentation method (keep, deep, shallow, none)
"  `delimiter_align`   | string  |  `r`                    | Determines how to align delimiters of different lengths
"  `align`             | string  |  `l`                    | Alignment modes for multiple occurrences of delimiters
" -------------------+---------+-----------------------+--------------------------------------------------------
"
"  option缩写
" -------------------+-----------------+-------------+--------------------------------
" Option name        | Shortcut key    | Abbreviated | Global variable                
" -------------------+-----------------+-------------+--------------------------------
"  `filter`            | CTRL-F          |  `[gv]/.*/`   |
"  `left_margin`       | CTRL-L          |  `l[0-9]+`    |
"  `right_margin`      | CTRL-R          |  `r[0-9]+`    |
"  `stick_to_left`     | <Left>, <Right> |  `<`  or  `>`   |
"  `ignore_groups`     | CTRL-G          |  `ig\[.*\]`   |  `g:easy_align_ignore_groups`
"  `ignore_unmatched`  | CTRL-U          |  `iu[01]`     |  `g:easy_align_ignore_unmatched`
"  `indentation`       | CTRL-I          |  `i[ksdn]`    |  `g:easy_align_indentation`
"  `delimiter_align`   | CTRL-D          |  `d[lrc]`     |  `g:easy_align_delimiter_align`
"  `align`             | CTRL-A          |  `a[lrc*]*`   |
" -------------------+-----------------+-------------+--------------------------------
"
" command: EasyAlign 开启对齐命令,按CTRL-X进行交互
"          LiveEasyAlign 开启live模式,live模式下按CTRL-P进行交互
"
"    nmap: ga EasyAlign
"    xmap: ga EasyAlign
" VIM Version: 7.4
"  author: tenfyzhong
"   email: 364755805@qq.com
" created: 2016-04-19 21:50:28
"==============================================================
PluginAdd 'junegunn/vim-easy-align'

nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)
