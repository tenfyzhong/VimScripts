"==============================================================
"    file: gist-vim.vim
"   brief: 向gist.github.com提交gist
"
" command: Gist 把当前buffer提交到gist
"          '<,'>Gist 把选择的内容提交的gist
"          Gist -p 创建一个private的gist
"          Gist --private 
"          Gist -P 创建了个public的gist
"          Gist --public 
"          Gist -a 创建一个匿名的gist
"          Gist --anonymous
"          Gist -m 对所有打开的buffer创建一个gist
"          Gist --multibuffer
"          Gist -e 编辑一个打开的gist
"          Gist --edit
"          Gist -e foo.js 使用foo.js编辑gist
"          Gist -s something 提交gist并增加描述
"          Gist --description something
"          Gist -e -s something
"          Gist -d 删除打开的gist
"          Gist --delete
"          Gist -f fork打开的gist
"          Gist --fork
"          Gist +1 对打开的gist加星
"          Gist -1 取消对打开的gist加星
"          Gist xxxxx 拉取gist xxxxx
"          Gist -c xxxxx 把gist xxxxx拉下来并复制到clipboard
"          Gist -l 列出你所有的gist
"          Gist --list
"          Gist -l username 列出username所有的gist
"          Gist -la 列出所有人的gist
"          Gist --listall
"          Gist -b 在浏览器打开gist
"          Gist --browser
"          Gist! 当成新的gist进来post
"
"   在gist列表页:
"   'o'/<ENTER> 打开当前的gist
"   'b' 在浏览器打开当前的gist
"   'y' 复制到clipboard
"   'p' 复制粘贴
"   <ESC> 关闭列表
" VIM Version: 8.0
"  author: tenfy
"   email: tenfy@tenfy.cn
" created: 2017-06-07 09:08:46
"==============================================================
PluginAdd 'mattn/webapi-vim'
PluginAdd 'mattn/gist-vim'

let g:gist_show_privates = 1
let g:gist_get_multiplefile = 1
