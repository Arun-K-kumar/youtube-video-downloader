@echo off
title yt-dlp Safe Downloader
echo ===============================
echo   YT-DLP HD Downloader (1080p)
echo ===============================
echo.
echo Select download mode:
echo 1. Download single video
echo 2. Download playlist
echo.
set /p choice=Enter your choice (1 or 2): 
echo.

if "%choice%"=="1" goto single
if "%choice%"=="2" goto playlist
echo ❌ Invalid choice. Please enter 1 or 2.
echo.
pause
exit /b

:single
set /p url=Enter YouTube video URL: 
if "%url%"=="" (
    echo ❌ URL cannot be empty.
    goto single
)
echo.
echo ⏳ Downloading video...
echo.
yt-dlp -f "bv*[height<=1080]+ba/best[height<=1080]" ^
--merge-output-format mp4 ^
--sub-langs "en.*" ^
--embed-subs ^
--no-keep-video ^
--ignore-errors ^
--no-warnings ^
-o "%%(title)s.%%(ext)s" ^
"%url%"
echo.
if errorlevel 1 (
    echo ⚠️  Download completed with warnings/errors.
) else (
    echo ✅ Video downloaded successfully!
)
pause
exit /b

:playlist
set /p url=Enter YouTube playlist URL: 
if "%url%"=="" (
    echo ❌ URL cannot be empty.
    goto playlist
)
echo.
echo ⏳ Downloading playlist...
echo.
yt-dlp -f "bv*[height<=1080]+ba/best[height<=1080]" ^
--merge-output-format mp4 ^
--sub-langs "en.*" ^
--embed-subs ^
--no-keep-video ^
--ignore-errors ^
--no-warnings ^
-o "%%(playlist)s/%%(playlist_index)s - %%(title)s.%%(ext)s" ^
"%url%"
echo.
if errorlevel 1 (
    echo ⚠️  Download completed with warnings/errors.
) else (
    echo ✅ Playlist downloaded successfully!
)
pause
exit /b