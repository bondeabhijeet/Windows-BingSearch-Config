@echo off
REM Script to enable or disable Bing search in Windows 10/11 Start Menu

REM Set color codes
set color_menu=0A
set color_text=0F
set color_error=0C

REM Enable delayed expansion
setlocal enabledelayedexpansion

:menu
cls
color %color_menu%
echo ==========================================
echo          Bing Search Configuration
echo ==========================================
echo Developed by @bondeabhijeet
echo ==========================================
echo 1. Disable Bing Search
echo 2. Enable Bing Search
echo 3. Exit
echo ==========================================
choice /c 123 /n /m "Enter your choice: "
set choice=%errorlevel%

if %choice%==1 goto disable
if %choice%==2 goto enable
if %choice%==3 goto exit
color %color_error%
echo Invalid choice. Please select 1, 2, or 3.
pause
goto menu

:disable
cls
color %color_text%
echo Disabling Bing search in Start Menu...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v BingSearchEnabled /t REG_DWORD /d 0 /f
if %errorlevel% equ 0 (
    echo Bing search has been successfully disabled.
) else (
    color %color_error%
    echo Failed to disable Bing search.
)
pause
goto menu

:enable
cls
color %color_text%
echo Enabling Bing search in Start Menu...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v BingSearchEnabled /t REG_DWORD /d 1 /f
if %errorlevel% equ 0 (
    echo Bing search has been successfully enabled.
) else (
    color %color_error%
    echo Failed to enable Bing search.
)
pause
goto menu

:exit
cls
color %color_text%
echo Exiting...
timeout /t 0 >nul
exit
