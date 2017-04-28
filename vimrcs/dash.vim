"==============================================================
"    file: dash.vim.vimrc
"   brief: dash的vim集成，这个插件只有mac才有用
"
" command: Dash[!] [TERM] [KEYWORD] 在dash中搜索当前文件类型的关键字，
"                 [!]则全局搜索，第1个参数是要搜索的内容，第二个参数是doc
"                 set类型
"          DashKeywords[!] 显示当前使用的keywords，或者设置keywords 
"
"    nmap: <leader>ds 搜索当前光标的单词
" VIM Version: 7.4
"  author: tenfyzhong
"   email: tenfyzhong@qq.com
" created: 2016-12-23 13:14:37
"==============================================================
if !has('mac')
    finish
endif

PluginAdd 'rizzatti/dash.vim'

nmap <silent><leader>ds <Plug>DashSearch
