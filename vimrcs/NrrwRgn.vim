"==============================================================
"    file: NrrwRgn.vimrc
"   brief: 对选定内容进行编辑
"
" command: [range]NarrowRegion[!]
"          [range]NR[!] 选定range的内容到编辑区,[!]使用当前buffer
"          NarrowWindow[!]
"          NW[!] 选定当前窗口可见的内容到编辑区,[!]使用当前buffer
"          WidenRegion[!] 将修改写回到原来的buffer中,[!]会关闭当前的窗口
"          NRV[!] 将最后一次可视模式选择的内容放到编辑区,[!]会关闭当前的窗口
"          NUD 对当前的chunk进行diff模式
"          [range]NRPrepare[!]
"          [raneg]NRP[!] 标志内容，后面用NRM来将标志的显示出来,[!]会清掉之前的标志
"          NRMulti[!]
"          NRM[!] 将NRP标志的内容放到编辑区，同时清掉所有的标志,[!]使用当前buffer
"          NRSyncOnWrite
"          NRS 启动同步内容回到原始buffer
"          NRNoSyncOnWrite
"          NRN 关闭同步内容回到原始buffer
"          NRL[!] 重新上一次选择的区域到编辑区,[!]使用当前buffer
"
"    nmap: <leader>nr 后选择内容到编辑区
"
"    vmap: <leader>nr 将选择的内容放到编辑区
" VIM Version: 7.4
"  author: tenfyzhong
"   email: tenfyzhong@qq.com
" created: 2016-07-10 23:31:36
"==============================================================
PluginAdd 'chrisbra/NrrwRgn'
