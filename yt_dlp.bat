@echo off
title yt-dlp Safe Downloader
echo ===============================
echo   YT-DLP HD Downloader (1080p)
echo ===============================
echo.
:input
set /p url=Enter YouTube URL: 
if "%url%"=="" (
    echo ❌ URL cannot be empty.
    goto input
)
echo.
echo ⏳ Downloading...
echo.
REM Save with predictable name
set "output=video"
yt-dlp -f "bv*+ba/best" ^
-S "res:1080,ext:mp4" ^
--merge-output-format mp4 ^
--write-auto-subs ^
--sub-langs "en" ^
--embed-subs ^
--no-keep-video ^
-o "%%(title)s.%%(ext)s" ^
"%url%"
echo.
echo *** You can exit now ***
pause