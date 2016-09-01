#VimScripts


##安装说明
###类unix
将克隆下来的VimScripts重命名为.vim，然后运行`bin/unix/install.sh`:
```bash
mv ~/.vim ~/.vim.bak # 备份之前自己的vim配置，若不存在则不用此操作
mv VimScripts ~/.vim
sh ~/.vim/install.sh
```

###windows
安装msysgit
将克隆下来的VimScripts重命令为vimfiles，然后运行`bin\windows\install.bat`
如果windows系统安装了python，vim会支持python。但是默认会从C:\Python27目录去
查找python(以python2.7为例)，如果找不到vim会crash。需要设置系统变量
```bash
PYTHONPATH=C:\Python27\Lib;C:\Python27\DLLs;C:\Python27\Lib\lib-tk
```

###common
使用csupport，可以在`.vim/resource/csupport`下修改Templates模板，使其支持自己的信息。

使用bash-support，可以在`.vim/resource/bash-support`下修改Templates模板，使其支持自己的信息。

在.vimrc中将`g:use_chinese_doc`设为1则使用中文文档。
若不成功，请运行`:BundleInstall`


##配置
通过配置`g:type_plugin_list`来加载vimrcs下子目录的插件，vimrcs下的插件默认全部
加载。`g:type_plugin_list`是一个列表。如果要加载所有的插件，只要包含`'**'`项即
可。配置例子：
```viml
let g:type_plugin_list = ["c", "go", "web"]
```
以上的例子会加载vimrcs目录下的c,go,web目录下的插件。

golang支持
需要安装: godef
```bash
go get -v code.google.com/p/rog-go/exp/cmd/godef
go install -v code.google.com/p/rog-go/exp/cmd/godef
```


##说明
对于要使用cscope的项目，在项目根路径生成cscope的数据库，用以下命令：
```bash
~/.vim/bin/unix/cscope.sh
```
cscope会从当前目录一直往上去查找cscope目录，找到则链接

对于没有后缀二进制文件，会使用perl来检查然后用xxd来进行打开
对于有后缀的二进制文件，为了减少perl检查的开销，请在`g:binary_extensions`里设置后缀

加入插件，在 `~/.vim/vimrcs/` 下加入一个.vimrc后缀的脚本，在脚本开头调用`PluginAdd`命令
加载插件，脚本下面可以加入其他的配置。例如：
```viml
PluginAdd 'a.vim'
```
对于不使用的插件，可以有以下操作：
-  将其移到`unused_vimrcs`目录下(建议)
-  将其脚本删除
-  将其.vimrc的后缀重命名为其他
-  在脚本的开头加上 `finish`

    `LookupGenTag`命令会生成lookupfile需要的tag文件，并链接。如果使用`!`会在当前目录
    去生成，否则会查找工程的根目录去生成，如果不存在工程，则也是在当前目录生成

    本地目录下增加`.vimrc`(windows下为`_vimrc`)，可以在加载完home目录下的.vimrc文件后，
    加载插件之前，去加载这个文件。可以在这个文件里做一些特殊的配置。比如可以调用
    `g:type_plugin_list`来加载特定的插件。


##建议
在crontab中加入清除备份文件和undo文件的脚本
```crontab
0 3 * * * find /home/tenfyzhong/.vim/.backupfile -mtime +10 -name "*~" | xargs rm -rf
0 3 * * * find /home/tenfyzhong/.vim/.undofile -mtime +10 -name "%*" | xargs rm -rf
```

大工程使用`TagHighlight`，建议定时后台跑`~/.vim/bin/unix/tag_highlight.sh`来生成tag，不然会卡死在生成tag。


##注意
- vim版本要求7.0以上，否则很多配置用不了，会直接不加载配置。
- 若退出vim时报未定义的变量b:NERDTree的错误，请将 `~/.vim/bundle/nerdtree/plugin/NERD_tree.vim`下augroup NERDTree 的autocmd BufWinLeave注释掉。
- YouCompleteMe的安装说明请参考其文档。

##自编译vim建议
加入以下的属性
- --with-features=huge：支持最大特性
- --enable-rubyinterp：启用Vim对ruby编写的插件的支持
- --enable-pythoninterp：启用Vim对python编写的插件的支持
- --enable-luainterp：启用Vim对lua编写的插件的支持
- --enable-perlinterp：启用Vim对perl编写的插件的支持
- --enable-multibyte：多字节支持 可以在Vim中输入中文
- --enable-cscope：Vim对cscope支持
- --enable-gui=gtk2：gtk2支持,也可以使用gnome，表示生成gvim


##依赖程序
- git:用于版本管理
- ctags:tags，如tagbag等要用到
- clang:youcompleteme需要用到
- cscope:生成cscope.out
- doxygen:用于生成代码文档
- sbcl:common lisp的编译器，slimv用到
- xterm:运行lisp解析器服务器


##命令
| command           | args   | describe                      |
|:------------------|:-------|:------------------------------|
| `PluginAdd`       | 参数名 | 安装插件                      |
| `RefreshCscope`   |        | 刷新cscope.out                |
| `LookupGenTag[!]` | 路径名 | 在路径下生成.lookypfile\_tags |


##键映射
以下model, n对应normal, i对应insert, v对应visual, c对应console, x对应选择模式
o对应motion模式

| map          | model | script            | describe                                |
|--------------|:------|:------------------|:----------------------------------------|
| `<F12>`      | n     | global            | 逆时间切换窗口                          |
| `<c-left>`   | n     | global            | 移到左边窗口                            |
| `<c-down>`   | n     | global            | 移到下边窗口                            |
| `<c-up>`     | n     | global            | 移到上边窗口                            |
| `<c-right>`  | n     | global            | 移到右边窗口                            |
| `<leader>h`  | n     | global            | 移到左边窗口                            |
| `<leader>j`  | n     | global            | 移到下边窗口                            |
| `<leader>k`  | n     | global            | 移到上边窗口                            |
| `<leader>l`  | n     | global            | 移到右边窗口                            |
| `<leader>w`  | n     | global            | 保存所有文件                            |
| `<leader>q`  | n     | global            | 关闭当前文件                            |
| `j`          | n     | global            | gj                                      |
| `gj`         | n     | global            | j                                       |
| `k`          | n     | global            | gk                                      |
| `gk`         | n     | global            | k                                       |
| `;`          | nx    | global            | :                                       |
| `<m-,>`      | n     | global            | ;                                       |
| `<leader>p`  | n     | global            | paste toggle                            |
| `[1`         | n     | global            | diff时取窗口1的内容                     |
| `[2`         | n     | global            | diff时取窗口2的内容                     |
| `[3`         | n     | global            | diff时取窗口3的内容                     |
| `[4`         | n     | global            | diff时取窗口4的内容                     |
| `]1`         | n     | global            | diff时将内容放到窗口1                   |
| `]2`         | n     | global            | diff时将内容放到窗口2                   |
| `]3`         | n     | global            | diff时将内容放到窗口3                   |
| `]4`         | n     | global            | diff时将内容放到窗口4                   |
| `<c-k>`      | c     | global            | 命令行上滚                              |
| `<c-j>`      | c     | global            | 命令行下滚                              |
| `<Space>`    | n     | global            | za                                      |
| `<leader>`n  | n     | global            | 切换行号模式                            |
| `<`          | v     | global            | `<gv`                                   |
| `>`          | v     | global            | `>gv`                                   |
| `af`         | o     | global            | 整个文件的motion动作                    |
| `<c-j>`      | n     | global            | gt                                      |
| `<c-k>`      | n     | global            | gT                                      |
| `<leader>as` | n     | a.vim             | 在源文件和头文件中切换                  |
| `<C-\\>s`    | n     | cscope            | 查找这个C符号                           |
| `<C-\\>g`    | n     | cscope            | 查找这个定义                            |
| `<C-\\>c`    | n     | cscope            | 查找调用这个函数的函数                  |
| `<C-\\>t`    | n     | cscope            | 查找这个字符串                          |
| `<C-\\>e`    | n     | cscope            | 查找这个egrep匹配模式                   |
| `<C-\\>f`    | n     | cscope            | 查找这个文件                            |
| `<C-\\>i`    | n     | cscope            | 查找#include这个文件的文件              |
| `<C-\\>d`    | n     | cscope            | 查找被这个函数调用的函数                |
| `<C-\_>s`    | n     | cscope            | 查找这个C符号,水平切分窗口              |
| `<C-\_>g`    | n     | cscope            | 查找这个定,水平切分窗口义               |
| `<C-\_>c`    | n     | cscope            | 查找调用这个函数的函,水平切分窗口数     |
| `<C-\_>t`    | n     | cscope            | 查找这个字符,水平切分窗口串             |
| `<C-\_>e`    | n     | cscope            | 查找这个egrep匹配模,水平切分窗口式      |
| `<C-\_>f`    | n     | cscope            | 查找这个文,水平切分窗口件               |
| `<C-\_>i`    | n     | cscope            | 查找#include这个文件的文,水平切分窗口件 |
| `<C-\_>d`    | n     | cscope            | 查找被这个函数调用的函,水平切分窗口数   |
| `<C-\_>s`    | n     | cscope            | 查找这个C符号,竖直切分窗口              |
| `<M-\\>g`    | n     | cscope            | 查找这个定,竖直切分窗口义               |
| `<M-\\>c`    | n     | cscope            | 查找调用这个函数的函,竖直切分窗口数     |
| `<M-\\>t`    | n     | cscope            | 查找这个字符,竖直切分窗口串             |
| `<M-\\>e`    | n     | cscope            | 查找这个egrep匹配模,竖直切分窗口式      |
| `<M-\\>f`    | n     | cscope            | 查找这个文,竖直切分窗口件               |
| `<M-\\>i`    | n     | cscope            | 查找#include这个文件的文,竖直切分窗口件 |
| `<M-\\>d`    | n     | cscope            | 查找被这个函数调用的函,竖直切分窗口数   |
| `<leader>tg` | n     | ctags             | 在当前目录生成tags                      |
| `<c-l>`      | n     | ctrlspace         | tablist中的下一个文件                   |
| `<c-h>`      | n     | ctrlspace         | tablist中的上一个文件                   |
| `<leader>nt` | n     | nerdtree          | 触发nerdtree                            |
| `<leader>tb` | n     | tagbar or taglist | 触发tagbar or taglist                   |
| `<leader>ta` | n     | tagbar or taglist | 触发tagbar和nerdtree                    |
| `<leader>bi` | n     | vundle            | Bundle安装插件                          |
| `<leader>qk` | n     | quickfix          | 上一条错误警告处                        |
| `<leader>qj` | n     | quickfix          | 下一条错误警告处                        |
| `<leader>qc` | n     | quickfix          | 关闭quickfix                            |
| `<leader>qo` | n     | quickfix          | 打开quckfix                             |
| `<leader>dx` | ni    | Doxygen           | 生成函数和类注释                        |
| `<leader>da` | ni    | Doxygen           | 生成文件注释                            |
| `<leader>dl` | ni    | Doxygen           | 生成证书注释                            |
| `<leader>gu` | n     | Gundo             | GundoToogle                             |
| `<leader>uf` | n     | lookupfile        | lookupfile                              |
| `<leader>ut` | n     | lookupfile        | lookupfile tags                         |
| `<leader>ub` | n     | lookupfile        | lookup file bufs                        |
| `<leader>uw` | n     | lookupfile        | lookup file walk                        |
| `gt`         | nx    | vim-easy-align    | 开启对齐                                |
| `<leader>M`  | n     | Mark              | 清除所有的mark                          |
| `<leader>N`  | n     | Mark              | 如果在高亮处，则取消高亮，否则触发高亮  |
| `Mm`         | n     | vim-bookmarks     | toggle一个bookmark                      |
| `Ma`         | n     | vim-bookmarks     | toggle一个annotate                      |
| `Ms`         | n     | vim-bookmarks     | 显示所有的bookmark和annotate            |
| `Mn`         | n     | vim-bookmarks     | 跳到下一个bookmark                      |
| `Mp`         | n     | vim-bookmarks     | 跳到上一个bookmark                      |
| `Mc`         | n     | vim-bookmarks     | 清除bookmark                            |
| `Mx`         | n     | vim-bookmarks     | 清除所有的bookmark                      |
| `Mu`         | n     | vim-bookmarks     | bookmark上移                            |
| `Md`         | n     | vim-bookmarks     | bookmark下移                            |
| `<leader>yj` | n     | YankRing          | 选择rankring中的更早一项                |
| `<leader>yk` | n     | YankRing          | 选择rankring中的更新一项                |
| `<leader>yr` | n     | YankRing          | YankRingShow                            |
| `<leader>ys` | n     | YankRing          | YankSearch                              |
| `\e`         | in    | emmet             | emmet leader key                        |
| `\js`        | in    | javacomplete2     | trying to guess import option           |
| `\ja`        | in    | javacomplete2     | will ask for import option              |
| `\jm`        | in    | javacomplete2     | add all missing imports                 |
| `\jr`        | in    | javacomplete2     | remove all missing imports              |
| `\ji`        | n     | eclim             | :JavaImport                             |
| `\jd`        | n     | eclim             | :JavaDocSearch -x declarations          |
| `\jc`        | n     | eclim             | :JavaSearchContext                      |
| `[h`         | n     | GitGutter         | 跳到上一个修改的块                      |
| `]h`         | n     | GitGutter         | 跳到下一个修改的块                      |
| `<leader>ga` | n     | GitGutter         | stage块                                 |
| `<leader>gr` | n     | GitGutter         | 回滚块                                  |
| `<leader>gp` | n     | GitGutter         | 预览滚块                                |
| `<leader>gg` | n     | GitGutter         | 刷新GitGutter                           |
| `<leader>gv` | n     | gitv              | Gitv                                    |
| `<leader>gw` | n     | fugitive          | Gwrite                                  |
| `<leader>gc` | n     | fugitive          | Gcommit                                 |
| `<leader>gb` | n     | fugitive          | Gblame                                  |
| `<leader>gd` | n     | fugitive          | Gvdiff                                  |
| `<leader>gl` | n     | fugitive          | Glog                                    |
| `<leader>gs` | n     | fugitive          | Gstatus                                 |
| `<leader>aw` | n     | argwrap           | 参数转换成同行或者换行模式              |
| `<leader>sw` | n     | windowswap        | 交换窗口                                |
| `\ap`        | in    | auto-pairs        | 触发补齐                                |
| `\ae`        | in    | auto-pairs        | 将后面的单词放到当前括号里              |
| `\an`        | in    | auto-pairs        | 跳到一个对齐的括号                      |


