@echo off

:: Check build directory.
set BUILD_DIR=..\build\vc12-x86d
if not exist %BUILD_DIR% mkdir %BUILD_DIR%
pushd %BUILD_DIR%

:: Run Conan.
echo [*] Conan is running...
conan ^
	install ^
	../.. ^
	-s arch=x86 ^
	-s build_type=Debug ^
	-s compiler="Visual Studio" ^
	-s compiler.runtime=MTd ^
	-s compiler.version=12 ^
	-s os=Windows ^
	--build missing
if errorlevel 1 goto :error

:: Run CMake.
echo [*] CMake is running...
cmake ^
	-G"Visual Studio 12 2013" ^
	-T "v120_xp" ^
	"-DCMAKE_CONFIGURATION_TYPES:STRING=Debug" ^
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
