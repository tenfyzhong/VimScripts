"==============================================================
"    file: vim-delve.vim
"   brief: go的调试器，依赖delve
"
" command:
"    | `DlvAddBreakpoint`             | Add a breakpoint at the current line.
"    | `DlvAddTracepoint`             | Add a tracepoint at the current line.
"    | `DlvAttach <pid> [flags]`      | Attach `dlv` to a running process.
"    | `DlvClearAll`                  | Clear all the breakpoints and tracepoints in the buffer.
"    | `DlvCore <bin> <dump> [flags]` | Debug core dumps using `dlv core`.
"    | `DlvDebug [flags]`             | Run `dlv debug` for the current session. Use this to test `main` packages.
"    | `DlvExec <bin> [flags]`        | Start `dlv` on a pre-built executable.
"    | `DlvRemoveBreakpoint`          | Remove the breakpoint at the current line.
"    | `DlvRemoveTracepoint`          | Remove the tracepoint at the current line.
"    | `DlvTest [flags]`              | Run `dlv test` for the current session. Use this to debug non-`main` packages.
"    | `DlvToggleBreakpoint`          | Convenience method to toggle (add or remove) a breakpoint at the current line.
"    | `DlvToggleTracepoint`          | Convenience method to toggle (add or remove) a tracepoint at the current line.
"    | `DlvVersion`                   | Print the `dlv` version.
" VIM Version: 8.0
"  author: zhongtenghui
"   email: zhongtenghui@gf.com.cn
" created: 2017-07-24 09:03:29
"==============================================================
if has('nvim')
    PluginAdd 'sebdah/vim-delve'
endif
