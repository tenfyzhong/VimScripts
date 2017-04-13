"==============================================================
"    file: vim-go.vimrc
"   brief: go-ide
"
" command: GoPath [path] 设置GOPATH
"          GoImport[!] [path] import一个包
"          GoImportAs [localname] [path] import一个包 alias一个名
"          GoDrop [path] 移除一个包
"          GoLint [packages] 使用golint格式化包
"          GoDoc [word] 打开文档
"          GoDocBrowser [word] 在浏览器中打开文档
"          GoFmt 格式化代码
"          GoImports import包和删除不需要的包
"          [range]GoPlay 分享代码到play.golang.org
"          GoVet[!] [options] 去街go vet
"          GoDef [identifier] 跳到声明或者定义
"          GoRun[!] [expand] 去街当前包的main函数
"          GoBuild[!] [expand] go build构建当前包
"          GoGenerate[!] [expand] go generate
"          GoInfo 显示cursor下字符串信息
"          GoInstall[!] [options] 安装包
"          GoTest[!] [expand] 运行测试
"          GoTestFunc[!] [expand] 运行特定的测试函数
"          GoTestCompile[!] [expand] 编译测试包
"          GoCoverage[!] [options] 生成覆盖报告
"          GoErrCheck [options] 检查错误
"          GoFiles 显示当前包的文件
"          GoDeps 显示当前包的依赖
"          GoInstallBinaries 安装这个vim插件需要的包
"          GoUpdateBinaries 更新这个vim插件需要的包
"          GoImplements 显示选择包的实现接口
"          GoRename [to] 重命名
"          GoOracleScope [path1] [path2] ... 修改g:go_oracle_scope设置
"          GoCallees 显示被调用的包
"          GoCallers 显示调用的包
"          GoDescribe 显示选择的语法和属性
"          GoCallstack 显示调用栈
"          GoFreevars 枚举free variables
"          GoChannelPeers 显示可能的发送接收channel
"          GoReferers 查询引用
"
"    nmap: <leader>rs go-implements
"          <leader>ri go-info
"          <leader>re go-rename
"          <leader>rr go-run
"          <leader>rb go-build
"          <leader>rt go-test
"          <leader>rf go-test-func
"          <leader>rd go-doc
"          <leader>rc go-coverage
" VIM Version: 7.4
"  author: tenfyzhong
"   email: 364755805@qq.com
" created: 2016-04-16 18:46:26
"==============================================================
PluginAdd 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_fail_silently = 1
let g:go_get_update = 0

let g:go_fmt_command = "goimports"

augroup go_filetype_local
    au!
    au FileType go nmap <leader>rs <Plug>(go-implements)
    au FileType go nmap <Leader>ri <Plug>(go-info)
    au FileType go nmap <Leader>re <Plug>(go-rename)
    au FileType go nmap <leader>rr <Plug>(go-run)
    au FileType go nmap <leader>rb <Plug>(go-build)
    au FileType go nmap <leader>rt <Plug>(go-test)
    au FileType go nmap <leader>rf <Plug>(go-test-func)
    au FileType go nmap <leader>rd <Plug>(go-doc)
    au FileType go nmap <leader>rc <Plug>(go-coverage)
augroup END
