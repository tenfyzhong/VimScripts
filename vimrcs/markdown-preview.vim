"==============================================================
"    file: markdown-preview.vim
"   brief: markdown预览，依赖nodejs和yarn
"
" command:
"       MarkdownPreview 打开预览窗口
"       MarkdownPreviewStop 关闭 markdown 预览窗口，并停止开启的服务进程
"    nmap:
"       <leader>rp 打开预览
"       <leader>rs 停止预览
" VIM Version: 8.0
"  author: tenfy
"   email: tenfy@tenfy.cn
" created: 2017-07-05 15:31:36
"==============================================================
PluginAdd 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

if has('macunix')
    let g:mkdp_path_to_chrome = "open -a Google\\ Chrome"
endif
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 0

augroup markdown_preview_init
    autocmd!
    autocmd FileType markdown nmap <silent><leader>rp <Plug>MarkdownPreview
    autocmd FileType markdown nmap <silent><leader>rs <Plug>StopMarkdownPreview
augroup END
