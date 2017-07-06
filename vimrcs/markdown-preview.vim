"==============================================================
"    file: markdown-preview.vim
"   brief: markdown预览
"
" command:
"       MarkdownPreview 打开预览窗口
"       MarkdownPreviewStop 关闭 markdown 预览窗口，并停止开启的服务进程
" VIM Version: 8.0
"  author: zhongtenghui
"   email: zhongtenghui@gf.com.cn
" created: 2017-07-05 15:31:36
"==============================================================
PluginAdd 'iamcco/markdown-preview.vim'

if has('macunix')
    let g:mkdp_path_to_chrome = "open -a Google\\ Chrome"
endif
let g:mkdp_auto_start = 0
