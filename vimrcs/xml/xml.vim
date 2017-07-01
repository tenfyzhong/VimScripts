"==============================================================
"    file: xml.vim.vimrc
"   brief: help xml-plugin
"
"    nmap: ;; 将当前word做为一个tag进行扩展
"   <LocalLeader>[ 删除<![CDATA[ ]]>分隔符
"   <LocalLeader>{ 删除<![CDATA[ ]]>块
"   <LocalLeader>] 删除<!-- -->分隔符
"   <LocalLeader>} 删除<!-- -->块
"   [[ 跳到上一个未关闭的tag
"   ]] 跳到下一个未关闭的tag
"   [] 跳到上一个关闭的tag
"   ][ 跳到下一个关闭的tag
"   [" 跳到上一个注释
"   ]" 跳到下一个注释
"   <LocalLeader>% 跳到匹配的tag
"   <LocalLeader>5 跳到匹配的tag
"   <LocalLeader>c 重命名tag
"   <LocalLeader>C 重命名tag和删除属性
"   <LocalLeader>d 删除包含的tag
"   <LocalLeader>D 删除tag和它里面的内容
"   <LocalLeader>e 加上关闭tag
"   <LocalLeader>f 折叠tag
"   <LocalLeader>F 所有的tag都折叠
"   <LocalLeader>g format
"   <LocalLeader>G cursor下的所有tag进行format
"   <LocalLeader>I 缩进所有的tag
"   <LocalLeader>j 将两个相同的结点连接在一起
"   <LocalLeader>l visual surround the block with listitem and para
"   <LocalLeader>o 在当前tag下插入一个tag
"   <LocalLeader>O 在当前tag外面插入一个tag
"   <LocalLeader>s 给右tag增加左tag
"   <LocalLeader>> tag右移
"   <LocalLeader>< tag左移
"   <LocalLeader>c 给选择的内容增加CDAT
"   <LocalLeader>< 给高亮的块注释
"   <LocalLeader>v 选择一个tag
" VIM Version: 7.4
"  author: tenfyzhong
"   email: tenfyzhong@qq.com
" created: 2016-04-16 18:01:40
"==============================================================
PluginAdd 'othree/xml.vim', {'for': 'xml'}

let g:xml_syntax_folding = 1

