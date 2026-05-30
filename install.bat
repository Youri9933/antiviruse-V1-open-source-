@echo off
REM Installation Script for Antivirus Maison
REM Windows Setup

echo.
echo ============================================================
echo   ANTIVIRUS MAISON - Installation Windows
echo ============================================================
echo.

REM Check if CMake is installed
cmake --version >nul 2>&1
if errorlevel 1 (
    echo [!] CMake not found!
    echo.
    echo Please install CMake from: https://cmake.org/download/
    echo Or run: choco install cmake
    echo.
    pause
    exit /b 1
)

echo [+] CMake found
cmake --version

REM Create build directory
if not exist build mkdir build

REM Configure CMake
echo.
echo [*] Configuring CMake...
cd build
cmake .. -G "Visual Studio 17 2022"

if errorlevel 1 (
    echo [!] CMake configuration failed!
    pause
    exit /b 1
)

REM Build
echo.
echo [*] Building C modules...
cmake --build . --config Release

if errorlevel 1 (
    echo [!] Build failed!
    pause
    exit /b 1
)

cd ..

echo.
echo ============================================================
echo   [+] Installation completed successfully!
echo ============================================================
echo.
echo Next steps:
echo   1. Activate venv: .\venv\Scripts\Activate.ps1
echo   2. Run tests: pytest tests/ -v
echo   3. Test scanner: .\build\Release\test_scanner.exe
echo.
pause
