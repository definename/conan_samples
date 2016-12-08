@echo off

:: Check build directory.
set BUILD_DIR=..\build\vc14-x86
if not exist %BUILD_DIR% mkdir %BUILD_DIR%
pushd %BUILD_DIR%

:: Run Conan
rem echo -- Conan is running!
rem conan ^
rem	install ^
rem	../.. ^
rem	-s build_type=Debug ^
rem	-s compiler="Visual Studio" ^
rem	-s compiler.version=14 ^
rem	-s compiler.runtime=MT ^
rem	-s arch=x86 ^
rem	--build missing
rem if errorlevel 1 goto :error

:: Run CMake.
echo -- Cmake is running!
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
