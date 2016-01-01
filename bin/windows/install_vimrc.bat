::create _vimrc

set BASEVIMRC="%HOMEPATH%\vimfiles\vimrc"
set VIMRC="%HOMEPATH%\_vimrc"
@echo "创建_vimrc"
del /F /Q %VIMRC%
mklink %VIMRC% %BASEVIMRC%
