@echo off

:: Check if build directory exists and delete it if it does
if exist build (
    echo Removing existing build directory...
    rmdir /s /q build
)

:: Create a new build directory
echo Creating new build directory...
mkdir build
cd build

:: Generate build files
echo Generating build files...
cmake ..

:: Build the project
echo Building the project...
cmake --build . --config Release
if %ERRORLEVEL% NEQ 0 (
    echo Build failed!
    pause
    exit /b %ERRORLEVEL%
)

echo Build successful! Running the executable...

:: Attempt to find and run the executable
for /r %%i in (*.exe) do (
    if "%%~nxi"=="ImGuiGLFWOpenGL3Example.exe" (
        echo Found executable: %%i
        start "" "%%i"
        exit /b 0
    )
)

echo Executable not found!
pause
