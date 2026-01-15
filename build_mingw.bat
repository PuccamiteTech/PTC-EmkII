@echo off

set PLAYER_LINK=https://github.com/PuccamiteTech/Partial-SSEQ-Player

rem Move and copy are VERY picky about which slashes you use.
set PROJECT_DIR=%~dp0\
set PLAYER_DIR=%PROJECT_DIR%external\sseq\\
set LIB_DIR=%PROJECT_DIR%lib\\
set BUILD_DIR=%PROJECT_DIR%build\\
set RES_DIR=%PROJECT_DIR%resources\\
set SFML_DIR=C:\SFML-2.6.2\\

set EXTRACTOR_FILE=%RES_DIR%nds_extract.bat
set ARCHIVE_FILE=%RES_DIR%rom.nds
set PLAYER_FILE=%PLAYER_DIR%SSEQPlayer.dll

if not exist "%PLAYER_DIR%" md "%PLAYER_DIR%"
if not exist "%LIB_DIR%" md "%LIB_DIR%"
if not exist "%BUILD_DIR%" md "%BUILD_DIR%"

git clone -b updates "%PLAYER_LINK%" "%PLAYER_DIR%" && ^
mingw32-make -C "%PLAYER_DIR%" lib && ^
move /y "%PLAYER_FILE%" "%LIB_DIR%" && ^
mingw32-make -C "%PROJECT_DIR%" && ^
copy /y "%SFML_DIR%bin\*" "%PROJECT_DIR%" && ^
copy /y "%LIB_DIR%*" && ^
cd /d "%RES_DIR%" && ^

rem TODO
rem call "%EXTRACTOR_FILE%" "%ARCHIVE_FILE%" && ^

cd /d "%PROJECT_DIR%"