"==============================================================
"    file: vim-signature.vimrc
"   brief: 显示mark标签
"
"    nmap:
"      mx 触发一个'x'字母的标签
"      m, 插入下一个可用的标签
"      m. 如果存在标签，则删除，否则插入下一个可用的标签
"      m- 删除当前行的所有标签
"      m<space> 删除所前buffer的所有标签
"      ]` 跳到下一个标签
"      [` 跳到上一个标签
"      ]' 跳到下一个标签的行首
"      [' 跳到上一个标签的行首
"      `] 跳到字母序的下一个标签
"      `[ 跳到字母序的上一个标签
"      '] 跳到字母序的下一个标签行首
"      '[ 跳到字母序的上一个标签行首
"      m/ 打开一个location list显示当前buffer的所有标签
"
"      0~9是类型标签，可以重复打
"      m[0-9] 触发一个shift+数字上的字母标签,这类型的标签可以重复打
"      m<S-[0-9]> 删除所有抽类型的标签
"      ]- 跳到下一个有同样标签的行
"      [- 跳到上一个有同样标签的行
"      ]= 跳到下一个任意类型的标签
"      [= 跳到上一个任意类型的标签
"      m? 打开一个location list显示所有当前buffer的类型标签
"      m<BS> 删除所有的类型标签
"
" command: SignatureToggleSigns 触发显示标签
"          SignatureRefresh 刷新显示
"          SignatureListBufferMarks [n] 显示当前buffer的所有标签，n是上下文行数
"          SignatureListGlobalMarks [n] 显示所有buffer的所有标签，n是上下文行数
"          SignatureListMarkers [marker] [n] 显示当前buffer所有的marker标签，n是上下文行数
"
" VIM Version: 7.4
"  author: tenfyzhong
"   email: 364755805@qq.com
" created: 2016-04-16 11:32:02
"==============================================================
PluginAdd 'kshenoy/vim-signature'
