"==============================================================
"    file: vimunx.vim
"   brief: 与tmux交互的插件
"
" command: VimuxPromptCommand 提示输入命令运行
"          VimuxRunLastCommand 运行上一次的命令
"          VimuxInspectRunner 进入运行窗口并进入选择模式
"          VimuxCloseRunner 关闭运行窗口
"          VimuxInterruptRunner 给运行窗口发送中断信号
"          VimuxZoomRunner 将运行窗口全屏，在tmux下使用<prefix>z返回
"
"    nmap: <leader>vp :VimuxPromptCommand
"          <leader>vl :VimuxRunLastCommand
"          <leader>vi :VimuxInspectRunner
"          <leader>vq :VimuxCloseRunner
"          <leader>vc :VimuxInterruptRunner
"          <leader>vz :VimuxZoomRunner
" VIM Version: 7.4
"  author: tenfyzhong
"   email: 364755805@qq.com
" created: 2017-04-21 09:51:08
"==============================================================
PluginAdd 'benmills/vimux'

nnoremap <Leader>vp :VimuxPromptCommand<CR>
nnoremap <Leader>vl :VimuxRunLastCommand<CR>
nnoremap <Leader>vi :VimuxInspectRunner<CR>
nnoremap <Leader>vq :VimuxCloseRunner<CR>
nnoremap <Leader>vc :VimuxInterruptRunner<CR>
nnoremap <Leader>vz :VimuxZoomRunner<CR>

