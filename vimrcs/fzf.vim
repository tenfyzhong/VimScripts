"==============================================================
"    file: fzf.vim.vimrc
"   brief: 适配fzf工具
"
" command: [!]进行全屏模式
"      FZF {option} {path} " 从path进行搜索，不提供时为当前目录
"      以下命令以FZF为前缀
"      `Files [PATH]`    | Files (similar to  `:FZF` )
"      `GFiles [OPTS]`   | Git files (git ls-files)
"      `GFiles?`         | Git files (git status)
"      `Buffers`         | Open buffers
"      `Colors`          | Color schemes
"      `Ag [PATTERN]`    | {ag}{5} search result (ALT-A to select all, ALT-D to deselect all)
"      `Lines [QUERY]`   | Lines in loaded buffers
"      `BLines [QUERY]`  | Lines in the current buffer
"      `Tags [QUERY]`    | Tags in the project ( `ctags -R` )
"      `BTags [QUERY]`   | Tags in the current buffer
"      `Marks`           | Marks
"      `Windows`         | Windows
"      `Locate PATTERN`  |  `locate`  command output
"      `History`         |  `v:oldfiles`  and open buffers
"      `History:`        | Command history
"      `History/`        | Search history
"      `Snippets`        | Snippets ({UltiSnips}{6})
"      `Commits`         | Git commits (requires {fugitive.vim}{7})
"      `BCommits`        | Git commits for the current buffer
"      `Commands`        | Commands
"      `Maps`            | Normal mode mappings
"      `Helptags`        | Help tags [1]
"      `Filetypes`       | File types
"
"    nmap:  <leader>fp :FZF 提示输入
"           <leader>ff :FZFFiles
"           <leader>fg :FZFGFiles
"           <leader>fb :FZFBuffers
"           <leader>fa :FZFAg
"           <leader>fh :FZFHistory
"           <leader>fw :FZFWindows
"           <leader>fm :FZFMarks
"           <leader>f: :FZFHistory:
"           <leader>fs :FZFSnippets
"           <leader>fc :FZFCommands
"           <leader><tab> nmap模式的map
"    omap:  <leader><tab> omap模式的map
"    xmap:  <leader><tab> xmap模式的map
" VIM Version: 7.4
"  author: tenfyzhong
"   email: tenfyzhong@tencent.com
" created: 2017-02-09 16:27:42
"==============================================================

if isdirectory($HOME . '/.fzf/plugin')
    set rtp+=~/.fzf
elseif isdirectory('/usr/local/opt/fzf/plugin')
    set rtp+=/usr/local/opt/fzf
else
    finish
endif

PluginAdd 'junegunn/fzf.vim'
let g:fzf_command_prefix = 'FZF'

nnoremap <leader>fp :FZF
nnoremap <leader>ff :FZFFiles<cr>
nnoremap <leader>fg :FZFGFiles<cr>
nnoremap <leader>fb :FZFBuffers<cr>
nnoremap <leader>fa :FZFAg<cr>
nnoremap <leader>fh :FZFHistory<cr>
nnoremap <leader>fw :FZFWindows<cr>
nnoremap <leader>fm :FZFMarks<cr>
nnoremap <leader>f: :FZFHistory:<cr>
nnoremap <leader>fs :FZFSnippets<cr>
nnoremap <leader>fc :FZFCommands<cr>

nmap <leader><tab> <plug>(fzf-maps-n)
omap <leader><tab> <plug>(fzf-maps-o)
xmap <leader><tab> <plug>(fzf-maps-x)
