@echo off
cls

set KFGameExePath="C:\Program Files (x86)\Steam\SteamApps\common\killingfloor2\Binaries\Win64\"
set LaunchParams=-nostartupmovies

echo ================================================================================
echo Killing Floor 2 Guaranteed Startup Script
echo ================================================================================
echo Starting Killing Floor 2 in crash-protection mode.

timeout /t 5
echo .
echo .
echo .

:: Window title
title Killing Floor 2 Guaranteed Startup

:: Check if the specified path to KFGame.exe exists
if exist %KFGameExePath% (
    cd %KFGameExePath%
    %= Check if the specified path contains KFGame.exe =%
    if exist KFGame.exe (
        call :StartOrRetry
    ) else (
        call :ExeNotFound
    )
) else (
    call :DirNotFound
)

:DirNotFound
echo ERROR: Directory %KFGameExePath% does not exist. Exiting.
pause
exit

:ExeNotFound
echo ERROR: KFGame.exe not found in %KFGameExePath%. Exiting.
pause
exit

:StartOrRetry
echo (%Time%) Attempting to start Killing Floor 2 ...
start /wait KFGame.exe %LaunchParams%
:: Non-zero return value indicates abnormal exit: issue, error, crash, etc.
if %ErrorLevel% neq 0 (
    call :RetryOnCrash
)
echo .
echo Killing Floor 2 has been closed normally. Press any key to finish.
pause
exit

:RetryOnCrash
echo (%Time%) WARNING: Killing Floor 2 crashed, restarting.
:: Close all leftover BugSplat windows
tasklist | find /i "BsSndRpt64.exe" > NUL && taskkill /f /im BsSndRpt64.exe > NUL
goto StartOrRetry
