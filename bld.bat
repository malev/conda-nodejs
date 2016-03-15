if "%ARCH%"=="32" (
   set PLATFORM=x86
) else (
  set PLATFORM=x64
)

call vcbuild.bat nosign release %PLATFORM%

COPY Release\node.exe "%LIBRARY_BIN%\node.exe"

curl -LO https://github.com/npm/npm/archive/v3.8.2.zip
gunzip -d v3.8.2.zip

mkdir "%LIBRARY_BIN%\node_modules"
mkdir "%LIBRARY_BIN%\node_modules\npm"
ROBOCOPY npm-3.8.2\ "%LIBRARY_BIN%\node_modules\npm" * /E
COPY npm-3.8.2\bin\npm.cmd "%LIBRARY_BIN%\npm.cmd"

if %ERRORLEVEL% LSS 8 exit 0
