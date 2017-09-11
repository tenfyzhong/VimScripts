"==============================================================
"    file: TagHighlight.vimrc
"   brief: 高亮类，变量，类型等
"
" command: UpdateTypesFile 创建高亮的tag文件,递归到工程的根目录
"          UpdateTypesfileOnly 使用已经存在的tag文件来高亮
"          ReadTypes 手动读入文件类型来高亮
" VIM Version: 7.4
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2016-04-14 22:11:56
"==============================================================
PluginAdd 'magic-dot-files/TagHighlight'

if !exists("g:TagHighlightSettings")
    let g:TagHighlightSettings = {}
endif

let g:TagHighlightSettings['TypesFilePrefix'] = ".types"
