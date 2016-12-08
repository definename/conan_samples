@echo off

:: Check build directory.
set BUILD_DIR=..\build\vc14-x64
if not exist %BUILD_DIR% mkdir %BUILD_DIR%
pushd %BUILD_DIR%

:: Run Conan
echo -- Running Conan stuff!
conan ^
	search ^
	Poco/1.7.5@lasote/stable -q "arch=x64 AND build_type=Debug"
if errorlevel 1 goto :error

:: Exit
echo -- Build succeeded!
popd
goto :eof

:error
echo ERROR: Failed to build project - see above and correct.
popd
exit /b 1
