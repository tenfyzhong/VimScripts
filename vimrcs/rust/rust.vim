"==============================================================
"    file: rust.vim
"   brief: 
" 
" command: RustRun [args] 编译运行当前文件
"          RustRun! [rustc-args] [--] [args]
"          RustExpand [args] 使用--pretty扩展当前文件
"          RustExpand! [TYPE] [args]
"          RustEmitIr [args] 编译当前文件到LLVM IR
"          RustEmitAsm [args] 编译当前文件到assembly
"          RustFmt 格式化
"          RustFmtRange 对选择的区域进行格式化
" VIM Version: 8.0
"  author: tenfyzhong
"   email: tenfyzhong@qq.com
" created: 2017-05-06 11:00:25
"==============================================================
PluginAdd 'rust-lang/rust.vim'

let g:rustfmt_autosave = 1
let g:rustfmt_fail_silently = 1
