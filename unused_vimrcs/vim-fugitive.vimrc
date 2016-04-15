"==============================================================
"    file: vim-fugitive.vimrc
"   brief: 运行git命令
"
" command: 
"     Git! [args] 运行git命令,先cd到版本库的根目录,再执行!git [args],叹号会将输入放到一个临时buffer中
"     Gcd [directory] cd到版本库的相对目录
"     Glcd [directory] lcd到版本库的相对目录
"     Gstatus 显示当前版本库的状态
"     Gcommit [args] 提交修改,没有内容提交时会执行Gstatus
"     Gmerge [args] 合并
"     Gpull [args] git pull
"     Gpush [args] git push
"     Gfetch [args] git fetch
"     Ggrep [args] git-grep
"     Glgrep [args] git-grep
"     {range}Glog [args] git log
"     Gllog [args] like Glog
"     Gedit [revision] :edit a fugitive-revision
"     Gsplit! [revision] :split a fugitive-revison
"     Gvsplit! [revision] :vsplit a fugitive-revison
"     Gtabedit! [revision] :tabedit a fugitive-revison
"     Gpedit! [revision] :pedit a fugitive-revison
" VIM Version: 7.4
"  author: tenfyzhong
"   email: 364755805@qq.com
" created: 2016-04-15 15:39:29
"==============================================================
PluginAdd 'tpope/vim-fugitive'

