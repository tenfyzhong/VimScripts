::运行BundleInstall加载插件
@echo "加载插件"
set NOVIMWARNING=1
vim -c BundleClean -c BundleInstall -c qa!
