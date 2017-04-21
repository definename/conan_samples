@echo off

:: Check build directory.
set BUILD_DIR=..\build\vc14-x86
if not exist %BUILD_DIR% mkdir %BUILD_DIR%
pushd %BUILD_DIR%

:: Run Conan
echo [*] Conan is running...
conan ^
	install ^
	../.. ^
	-s arch=x86 ^
	-s build_type=Release ^
	-s compiler="Visual Studio" ^
	-s compiler.runtime=MT ^
	-s compiler.version=14 ^
	-s os=Windows ^
	--build missing
if errorlevel 1 goto :error

:: Run CMake.
echo [*] CMake is running...
cmake ^
	-G"Visual Studio 14 2015" ^
	-T "v140_xp" ^
	"-DBUILD_WITH_STATIC_CRT:BOOL=ON" ^
	../..
if errorlevel 1 goto :error

:: Exit
echo [*] Project generation succeeded!
popd
goto :eof

:: Error handling
:error
echo [!] ERROR: Failed to generate project - see above and correct.
popd
exit /b 1
