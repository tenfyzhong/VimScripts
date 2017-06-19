# VimScripts


## 安装说明
### 类unix
将克隆下来的VimScripts重命名为.vim，然后运行`bin/unix/install.sh`:
```bash
mv ~/.vim ~/.vim.bak # 备份之前自己的vim配置，若不存在则不用此操作
mv VimScripts ~/.vim
sh ~/.vim/install.sh
```

### windows
安装msysgit
将克隆下来的VimScripts重命令为vimfiles，然后运行`bin\windows\install.bat`
如果windows系统安装了python，vim会支持python。但是默认会从C:\Python27目录去
查找python(以python2.7为例)，如果找不到vim会crash。需要设置系统变量
```bash
PYTHONPATH=C:\Python27\Lib;C:\Python27\DLLs;C:\Python27\Lib\lib-tk
```

### common
在.vimrc中将`g:use_chinese_doc`设为1则使用中文文档。
若不成功，请运行`:PlugInstall`


## 配置
通过配置`g:type_plugin_list`来加载vimrcs下子目录的插件，vimrcs下的插件默认全部
加载。`g:type_plugin_list`是一个列表。如果要加载所有的插件，只要包含`'**'`项即
可。配置例子：
```viml
let g:type_plugin_list = ["c", "go", "web"]
```
以上的例子会加载vimrcs目录下的c,go,web目录下的插件。


## 说明
对于要使用cscope的项目，在项目根路径生成cscope的数据库，用以下命令：
```bash
~/.vim/bin/unix/cscope.sh
```
cscope会从当前目录一直往上去查找cscope目录，找到则链接

加入插件，在 `~/.vim/vimrcs/` 下加入一个.vimrc或.vim后缀的脚本，
在脚本开头调用`PluginAdd`命令 加载插件，脚本下面可以加入其他的配置。例如：
```viml
PluginAdd 'a.vim'
```
对于不使用的插件，可以有以下操作：
-  将其移到`unused_vimrcs`目录下(建议)
-  将其脚本删除
-  将其.vimrc的后缀重命名为其他
-  在脚本的开头加上 `finish`


本地目录下增加`.vimrc`(windows下为`_vimrc`)，可以在加载完home目录下的.vimrc文件后，
加载插件之前，去加载这个文件。可以在这个文件里做一些特殊的配置。比如可以调用
`g:type_plugin_list`来加载特定的插件。

对于大于100K的文件，如果foldmethod为syntax，会将它设成indent，以加快打开速度  

## 建议
在crontab中加入清除备份文件和undo文件的脚本
```crontab
0 3 * * * find /home/tenfyzhong/.vim/.backupfile -mtime +10 -name "*~" -delete
0 3 * * * find /home/tenfyzhong/.vim/.undofile -mtime +10 -name "%*" -delete
```


## 注意
- vim版本使用最新的版本，否则有些特性用不了
- YouCompleteMe的安装说明请参考其文档。

## 自编译vim建议
加入以下的属性
--with-features=huge --enable-rubyinterp --enable-pythoninterp 
--enable-python3interp --enable-luainterp --enable-perlinterp 
--enable-multibyte --enable-cscope --enable-gui=gtk2  
- --with-features=huge：支持最大特性
- --enable-rubyinterp：启用Vim对ruby编写的插件的支持
- --enable-pythoninterp：启用Vim对python编写的插件的支持
- --enable-python3interp：启用Vim对python3编写的插件的支持
- --enable-luainterp：启用Vim对lua编写的插件的支持
- --enable-perlinterp：启用Vim对perl编写的插件的支持
- --enable-multibyte：多字节支持 可以在Vim中输入中文
- --enable-cscope：Vim对cscope支持
- --enable-gui=gtk2：gtk2支持,也可以使用gnome，表示生成gvim


## 依赖程序
- git:用于版本管理
- ctags:tags，如tagbag等要用到
- clang:youcompleteme需要用到
- cscope:生成cscope.out
- doxygen:用于生成代码文档
- sbcl:common lisp的编译器，slimv用到
- xterm:运行lisp解析器服务器


## 命令
| command           | args   | describe                      |
|:------------------|:-------|:------------------------------|
| `PluginAdd`       | 插件名 | 安装插件                      |


## 键映射
以下model, n对应normal, i对应insert, v对应visual, c对应console, x对应选择模式
o对应motion模式

| map               | model | script             | describe                                |
|-------------------|:------|:-------------------|:----------------------------------------|
| `<leader>w`       | n     | global             | 保存所有文件                            |
| `j`               | n     | global             | gj                                      |
| `gj`              | n     | global             | j                                       |
| `k`               | n     | global             | gk                                      |
| `gk`              | n     | global             | k                                       |
| `;`               | nx    | global             | :                                       |
| `<m-,>`           | n     | global             | ;                                       |
| `[1`              | n     | global             | diff时取窗口1的内容                     |
| `[2`              | n     | global             | diff时取窗口2的内容                     |
| `[3`              | n     | global             | diff时取窗口3的内容                     |
| `[4`              | n     | global             | diff时取窗口4的内容                     |
| `]1`              | n     | global             | diff时将内容放到窗口1                   |
| `]2`              | n     | global             | diff时将内容放到窗口2                   |
| `]3`              | n     | global             | diff时将内容放到窗口3                   |
| `]4`              | n     | global             | diff时将内容放到窗口4                   |
| `<c-k>`           | c     | global             | 命令行上滚                              |
| `<c-j>`           | c     | global             | 命令行下滚                              |
| `<Space>`         | n     | global             | za                                      |
| `<leader><Space>` | n     | global             | zA                                      |
| `<leader>`n       | n     | global             | 切换行号模式                            |
| `<`               | v     | global             | `<gv`                                   |
| `>`               | v     | global             | `>gv`                                   |
| `af`              | o     | global             | 整个文件的motion动作                    |
| `<leader>tn`      | n     | global             | :tabnew                                 |
| `<leader>tc`      | n     | global             | :tabclose                               |
| `<leader>cf`      | n     | global             | 复制文件名(不包括路径)到匿名缓存区      |
| `<leader>cp`      | n     | global             | 复制文件名和路径到匿名缓存区            |
| `<m-j>`           | n     | global             | gT                                      |
| `<m-k>`           | n     | global             | gt                                      |
| `<leader>p`       | n     | global             | pastetoggle                             |
| `<leader>xx`      | n     | global             | 在16进制的xxd中切换                     |
| `<leader>o`       | n     | global             | redraw!                                 |
| `<leader>as`      | n     | a.vim              | 在源文件和头文件中切换                  |
| `<C-\>s`          | n     | cscope             | 查找这个C符号                           |
| `<C-\>g`          | n     | cscope             | 查找这个定义                            |
| `<C-\>c`          | n     | cscope             | 查找调用这个函数的函数                  |
| `<C-\>t`          | n     | cscope             | 查找这个字符串                          |
| `<C-\>e`          | n     | cscope             | 查找这个egrep匹配模式                   |
| `<C-\>f`          | n     | cscope             | 查找这个文件                            |
| `<C-\>i`          | n     | cscope             | 查找#include这个文件的文件              |
| `<C-\>d`          | n     | cscope             | 查找被这个函数调用的函数                |
| `<C-_>ss`         | n     | cscope             | 查找这个C符号,水平切分窗口              |
| `<C-_>sg`         | n     | cscope             | 查找这个定,水平切分窗口义               |
| `<C-_>sc`         | n     | cscope             | 查找调用这个函数的函,水平切分窗口数     |
| `<C-_>st`         | n     | cscope             | 查找这个字符,水平切分窗口串             |
| `<C-_>se`         | n     | cscope             | 查找这个egrep匹配模,水平切分窗口式      |
| `<C-_>sf`         | n     | cscope             | 查找这个文,水平切分窗口件               |
| `<C-_>si`         | n     | cscope             | 查找#include这个文件的文,水平切分窗口件 |
| `<C-_>sd`         | n     | cscope             | 查找被这个函数调用的函,水平切分窗口数   |
| `<C-_>vs`         | n     | cscope             | 查找这个C符号,竖直切分窗口              |
| `<M-_>vg`         | n     | cscope             | 查找这个定,竖直切分窗口义               |
| `<M-_>vc`         | n     | cscope             | 查找调用这个函数的函,竖直切分窗口数     |
| `<M-_>vt`         | n     | cscope             | 查找这个字符,竖直切分窗口串             |
| `<M-_>ve`         | n     | cscope             | 查找这个egrep匹配模,竖直切分窗口式      |
| `<M-_>vf`         | n     | cscope             | 查找这个文,竖直切分窗口件               |
| `<M-_>vi`         | n     | cscope             | 查找#include这个文件的文,竖直切分窗口件 |
| `<M-_>vd`         | n     | cscope             | 查找被这个函数调用的函,竖直切分窗口数   |
| `<leader>tg`      | n     | ctags              | 在当前目录生成tags                      |
| `<c-l>`           | n     | ctrlspace          | tablist中的下一个文件                   |
| `<c-h>`           | n     | ctrlspace          | tablist中的上一个文件                   |
| `<leader>nt`      | n     | nerdtree           | 触发nerdtree                            |
| `<leader>nc`      | n     | nerdtree           | NERDTreeCWD                             |
| `<leader>np`      | n     | nerdtree           | NERDTree parent                         |
| `<leader>nf`      | n     | nerdtree           | NERDTree %                              |
| `<leader>tb`      | n     | tagbar or taglist  | 触发tagbar or taglist                   |
| `<leader>ta`      | n     | tagbar or taglist  | 触发tagbar和nerdtree                    |
| `<leader>qk`      | n     | quickfix           | 上一条错误警告处                        |
| `<leader>qj`      | n     | quickfix           | 下一条错误警告处                        |
| `<leader>qc`      | n     | quickfix           | 关闭quickfix或者loclist                 |
| `<leader>qo`      | n     | quickfix           | 打开quickfix或者loclist                 |
| `<leader>qq`      | n     | quickfix           | 打开quickfix                            |
| `<leader>ql`      | n     | quickfix           | 打开loclist                             |
| `<leader>dx`      | n     | Doxygen            | 生成函数和类注释                        |
| `<leader>da`      | n     | Doxygen            | 生成文件注释                            |
| `<leader>dl`      | n     | Doxygen            | 生成证书注释                            |
| `<leader>gu`      | n     | Gundo              | GundoToogle                             |
| `ga`              | nx    | vim-easy-align     | 开启对齐                                |
| `<leader>M`       | n     | Mark               | 清除所有的mark                          |
| `<leader>N`       | n     | Mark               | 如果在高亮处，则取消高亮，否则触发高亮  |
| `<leader>R`       | nv    | Mark               | 根据正则进行高亮                        |
| `Mm`              | n     | vim-bookmarks      | toggle一个bookmark                      |
| `Ma`              | n     | vim-bookmarks      | toggle一个annotate                      |
| `Ms`              | n     | vim-bookmarks      | 显示所有的bookmark和annotate            |
| `Mn`              | n     | vim-bookmarks      | 跳到下一个bookmark                      |
| `Mp`              | n     | vim-bookmarks      | 跳到上一个bookmark                      |
| `Mc`              | n     | vim-bookmarks      | 清除bookmark                            |
| `Mx`              | n     | vim-bookmarks      | 清除所有的bookmark                      |
| `Mu`              | n     | vim-bookmarks      | bookmark上移                            |
| `Md`              | n     | vim-bookmarks      | bookmark下移                            |
| `\e`              | in    | emmet              | emmet leader key                        |
| `\js`             | in    | javacomplete2      | trying to guess import option           |
| `\ja`             | in    | javacomplete2      | will ask for import option              |
| `\jm`             | in    | javacomplete2      | add all missing imports                 |
| `\jr`             | in    | javacomplete2      | remove all missing imports              |
| `[h`              | n     | GitGutter          | 跳到上一个修改的块                      |
| `]h`              | n     | GitGutter          | 跳到下一个修改的块                      |
| `<leader>ga`      | n     | GitGutter          | stage块                                 |
| `<leader>gr`      | n     | GitGutter          | 回滚块                                  |
| `<leader>gp`      | n     | GitGutter          | 预览滚块                                |
| `<leader>gg`      | n     | GitGutter          | 刷新GitGutter                           |
| `<leader>gv`      | n     | gitv               | Gitv                                    |
| `<leader>gw`      | n     | fugitive           | Gwrite                                  |
| `<leader>gc`      | n     | fugitive           | Gcommit                                 |
| `<leader>gb`      | n     | fugitive           | Gblame                                  |
| `<leader>gd`      | n     | fugitive           | Gvdiff                                  |
| `<leader>gl`      | n     | fugitive           | Glog                                    |
| `<leader>gs`      | n     | fugitive           | Gstatus                                 |
| `<leader>aw`      | n     | argwrap            | 参数转换成同行或者换行模式              |
| `<leader>sw`      | n     | windowswap         | 交换窗口                                |
| `\ap`             | in    | auto-pairs         | 触发补齐                                |
| `\ae`             | in    | auto-pairs         | 将后面的单词放到当前括号里              |
| `\an`             | in    | auto-pairs         | 跳到一个对齐的括号                      |
| `<leader>dd`      | n     | YouCompleteMe      | 查看当前的错误                          |
| `<leader>ds`      | n     | dash               | 在dash中搜索当前单词                    |
| `<leader>ff`      | n     | fzf                | FZFFiles                                |
| `<leader>fg`      | n     | fzf                | FZFGFiles                               |
| `<leader>fb`      | n     | fzf                | FZFBuffers                              |
| `<leader>fw`      | n     | fzf                | FZFWindowss                             |
| `<leader>fm`      | n     | fzf                | FZFMarks                                |
| `<leader>f:`      | n     | fzf                | FZFHistory:                             |
| `<leader>fs`      | n     | fzf                | FZFSnippets                             |
| `<leader>fc`      | n     | fzf                | FZFCommands                             |
| `<leader><tab>`   | nox   | fzf                | 查找对应的map进行执行                   |
| `<leader>af`      | n     | autoformat         | 进行autoformat                          |
| `<m-p>`           | nxi   | yankstack          | 选择更旧的进行paste                     |
| `<m-P>`           | nxi   | yankstack          | 选择更新的进行paste                     |
| `<leader>rs`      | n     | vim-go             | go-implements                           |
| `<leader>ri`      | n     | vim-go             | go-info                                 |
| `<leader>re`      | n     | vim-go             | go-rename                               |
| `<leader>rr`      | n     | vim-go             | go-run                                  |
| `<leader>rb`      | n     | vim-go             | go-build                                |
| `<leader>rt`      | n     | vim-go             | go-test                                 |
| `<leader>rf`      | n     | vim-go             | go-test-func                            |
| `<leader>rc`      | n     | vim-go             | go-coverage                             |
| `<leader>as`      | n     | vim-go             | go-alternate-edit                       |
| `<C-]>`           | n     | vim-go             | GoDef                                   |
| `<c-t>`           | n     | vim-go             | GoDefPop                                |
| `<leader>rr`      | n     | pymode             | :PymodeRun                              |
| `<leader>rb`      | n     | pymode             | 设置断点                                |
| `<leader>ra`      | n     | pymode             | autoimport                              |
| `<leader>rg`      | n     | pymode             | 跳到定义                                |
| `<leader>rd`      | n     | pymode             | show document                           |
| `<leader>rf`      | n     | pymode             | find it                                 |
| `<leader>ro`      | n     | pymode             | organize import                         |
| `<leader>re`      | n     | pymode             | 重命名                                  |
| `<leader>r1m`     | n     | pymode             | 重命名模块                              |
| `<leader>r1p`     | n     | pymode             | module to package                       |
| `<leader>rm`      | n     | pymode             | 提取方法                                |
| `<leader>rl`      | n     | pymode             | 提取变量                                |
| `<leader>ri`      | n     | pymode             | rope inline                             |
| `<leader>rv`      | n     | pymode             | move method/fields                      |
| `<leader>rnf`     | n     | pymode             | generate function                       |
| `<leader>rnc`     | n     | pymode             | generate class                          |
| `<leader>rnp`     | n     | pymode             | generate package                        |
| `<leader>rs`      | n     | pymode             | change signature                        |
| `<leader>ru`      | n     | pymode             | use function                            |
| `<m-h>`           | n     | airline            | 选择左边的buffer                        |
| `<m-l>`           | n     | airline            | 选择右边的buffer                        |
| `<leader>1`       | n     | airline            | 选择buffer 1                            |
| `<leader>2`       | n     | airline            | 选择buffer 2                            |
| `<leader>3`       | n     | airline            | 选择buffer 3                            |
| `<leader>4`       | n     | airline            | 选择buffer 4                            |
| `<leader>5`       | n     | airline            | 选择buffer 5                            |
| `<leader>6`       | n     | airline            | 选择buffer 6                            |
| `<leader>7`       | n     | airline            | 选择buffer 7                            |
| `<leader>8`       | n     | airline            | 选择buffer 8                            |
| `<leader>9`       | n     | airline            | 选择buffer 9                            |
| `<c-h>`           | n     | vim-tmux-navigator | 移到左边窗口                            |
| `<c-j>`           | n     | vim-tmux-navigator | 移到下边窗口                            |
| `<c-k>`           | n     | vim-tmux-navigator | 移到上边窗口                            |
| `<c-l>`           | n     | vim-tmux-navigator | 移到右边窗口                            |
| `<leader>vp`      | n     | vimux              | VimuxPromptCommand                      |
| `<leader>vl`      | n     | vimux              | VimuxRunLastCommand                     |
| `<leader>vi`      | n     | vimux              | VimuxInspectRunner                      |
| `<leader>vq`      | n     | vimux              | VimuxCloseRunner                        |
| `<leader>vc`      | n     | vimux              | VimuxInterruptRunner                    |
| `<leader>vz`      | n     | vimux              | VimuxZoomRunner                         |
