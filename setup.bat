@echo off
title yt-dlp Setup and Installation
echo ===============================
echo   YT-DLP Setup and Requirements
echo ===============================
echo.
echo This script will install yt-dlp and its dependencies.
echo.
pause

echo [1/3] Checking for Python...
python --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Python is not installed or not in PATH.
    echo.
    echo Please install Python from https://www.python.org/downloads/
    echo Make sure to check "Add Python to PATH" during installation.
    echo.
    pause
    exit /b 1
)
echo ✅ Python found!
echo.

echo [2/3] Installing/Updating yt-dlp...
python -m pip install --upgrade yt-dlp
if errorlevel 1 (
    echo ❌ Failed to install yt-dlp.
    pause
    exit /b 1
)
echo ✅ yt-dlp installed successfully!
echo.

echo [3/3] Installing FFmpeg (required for merging video/audio)...
echo.
echo Checking if FFmpeg is already installed...
ffmpeg -version >nul 2>&1
if errorlevel 1 (
    echo ⚠️  FFmpeg not found in PATH.
    echo.
    echo Installing FFmpeg via pip...
    python -m pip install --upgrade ffmpeg-python
    echo.
    echo ⚠️  NOTE: You may need to install FFmpeg manually for full functionality.
    echo Download from: https://ffmpeg.org/download.html
    echo Or use: winget install ffmpeg (if you have winget)
) else (
    echo  FFmpeg already installed!
)
echo.

echo ===============================
echo   Setup Complete!
echo ===============================
echo.
echo You can now run the yt-dlp downloader script.
echo.
pause