"==============================================================
"    file: vim-go.vim
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
"          GoVet[!] [options] 调用go vet
"          GoDef [identifier] 跳到声明或者定义
"          GoDefStack [number] 打开GoDef的跳转列表
"          GoDefStackClear 清除GoDefStack
"          GoDefPop [count] 跳回到上一次调用GoDef的地方
"          GoRun[!] [expand] 运行当前包的main函数
"          GoBuild[!] [expand] go build构建当前包
"          GoGenerate[!] [expand] go generate
"          GoInfo 显示cursor下函数的声明
"          GoInstall[!] [options] 安装包
"          GoTest[!] [expand] 运行测试
"          GoTestFunc[!] [expand] 运行特定的测试函数
"          GoTestCompile[!] [expand] 编译测试包
"          GoCoverage[!] [options] 生成覆盖报告
"          GoCoverageToggle[!] [options] 在GoCoverage和GoCoverageClear中转换
"          GoCoverageClear [options] 清除覆盖报告
"          GoCoverageBrowser[!] [options] 在浏览器中产生覆盖报告
"          GoErrCheck [options] 检查错误
"          GoFiles 显示当前包的文件
"          GoDeps 显示当前包的依赖
"          GoInstallBinaries 安装这个vim插件需要的包
"          GoUpdateBinaries 更新这个vim插件需要的包
"          GoImplements 显示选择包的实现接口
"          GoRename [to] 重命名
"          GoGuruScope [pattern] [pattern2] ... [patternN]
"          GoCallees 显示调用
"          GoCallers 显示被调用
"          GoDescribe 显示选择的语法和属性
"          GoCallstack 显示调用栈
"          GoFreevars 抽离出自由变量
"          GoChannelPeers 显示可能的发送接收channel
"          GoReferrers 查询引用
"          GoSameIds 高亮相同的identifiers
"          GoSameIdsClear 去除identifiers的高亮
"          GoSameIdsToggle 在GoSameIds和GoSameIdsClear中切换
"          GoSameIdsAutoToggle 触发启动自动高亮identifiers
"          GoMetaLinter [path] 调用gometalinter进行检查 
"          GoBuildTags [tags] 
"          AsmFmt 
"          GoAlternate[!] 在源文件和测试文件中切换
"          GoPointsTo 显示所有可能指向当前变量的指针
"          GoWhicherrs 显示当前可能的错误
"          GoDecls [file] 启动ctrlp.vim时才能用，显示所有的声明
"          GoDeclsDir [dir] 启动ctrlp.vim时才能用，显示所有的声明
"          GoImpl [receiver] [interface] 实现接口
"          [range]GoAddTags [key],[option] [key1],[option1] ... 给成员增加tag
"          [range]GoRemoveTags [key],[option] [key1],[option1] ... 给成员删除tag
"          GoAutoTypeInfoToggle toggle g:go_auto_type_info
"          GoFmtAutoSaveToggle toggle g:go_fmt_autosave
"          GoModFmtAutoSaveToggle toogle g:go_mod_fmt_autosave
"          GoAsmFmtAutoSaveToggle toggle g:go_asmfmt_autosave
"          GoMetaLinterAutoSaveToggle toggle g:go_metalinter_autosave
"          GoTemplateAutoCreateToggle toggle g:go_template_autocreate
"          GoKeyify 使用keyify来格式化结构
"          GoFillStruct 使用默认值填充struct没赋值的字段
"          GoIfErr 生成if err != nil {return ...}的错误返回
"          GoModFmt 使用go mod edit -fmt命令来过滤当前buffer
"
"          A 源文件和测试文件中切换
"          AV 源文件和测试文件中切换，在vsplit中打开
"          AS 源文件和测试文件中切换，在split中打开
"          AT 源文件和测试文件中切换，在tab中打开
"
"    nmap: <leader>rs go-implements
"          <leader>rd go-info
"          <leader>re go-rename
"          <leader>rr go-run
"          <leader>rb go-build
"          <leader>rtt go-test
"          <leader>rtf go-test-func
"          <leader>rc go-coverage
"          <leader>ri GoImport
"          <leader>ra GoImportAs
"          <leader>rf GoIfErr
"          <leader>aa go-alternate-edit
"          <leader>as go-alternate-split
"          <leader>av go-alternate-vertical
"          <leader>rh YCMHover
"          <c-q> GoReferrers
"          <C-]> GoDef
"          <C-t> GoDefPop
" VIM Version: 7.4
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2016-04-16 18:46:26
"==============================================================
Plug 'fatih/vim-go', {'do': ':GoInstallBinaries', 'tag': '*'}

let g:go_highlight_functions         = 0
let g:go_highlight_methods           = 0
let g:go_highlight_types             = 0
let g:go_highlight_operators         = 0
let g:go_highlight_build_constraints = 1
let g:go_fmt_fail_silently           = 1
let g:go_get_update                  = 0
let g:go_fmt_autosave                = 0
let g:go_imports_autosave            = 0
let g:go_metalinter_autosave         = 0
" let g:go_info_mode                   = 'guru'
let g:go_echo_go_info                = 0
let g:go_doc_popup_window            = 1

" 如果慢的话，把它去掉
" let g:go_fmt_command = 'goimports'

function! s:build_go_files()
    let l:file = expand('%')
    if l:file =~# '^\f\+_test\.go$'
        call go#test#Test(0, 1)
    elseif l:file =~# '^\f\+\.go$'
        call go#cmd#Build(0)
    endif
endfunction

augroup go_filetype_local
    autocmd!
    autocmd FileType go nmap <buffer><leader>r  <NOP>
    autocmd FileType go nmap <buffer><leader>rs <Plug>(go-implements)
    autocmd FileType go nmap <buffer><Leader>rd <Plug>(go-info)
    autocmd FileType go nmap <buffer><Leader>re <Plug>(go-rename)
    autocmd FileType go nmap <buffer><leader>rr <Plug>(go-run)
    autocmd FileType go nnoremap <buffer><leader>rb :<c-u>call <SID>build_go_files()<cr>
    autocmd FileType go nmap <buffer><leader>rtt <Plug>(go-test)
    autocmd FileType go nmap <buffer><leader>rtf <Plug>(go-test-func)
    autocmd FileType go nmap <silent><buffer><leader>rc :GoCoverageToggle! -gcflags=all=-l<cr>
    autocmd FileType go nnoremap <buffer><leader>ri :GoImport 
    autocmd FileType go nnoremap <buffer><leader>rf :GoIfErr<cr>
    autocmd FileType go nnoremap <buffer><leader>ra :GoImportAs 
    autocmd FileType go nmap <buffer><leader>aa <Plug>(go-alternate-edit)
    autocmd FileType go nmap <buffer><leader>as <Plug>(go-alternate-split)
    autocmd FileType go nmap <buffer><leader>av <Plug>(go-alternate-vertical)
    autocmd FileType go nnoremap <buffer><c-q> :GoReferrers<cr>

    autocmd FileType go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
    autocmd FileType go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
    autocmd FileType go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
    autocmd FileType go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
augroup END
