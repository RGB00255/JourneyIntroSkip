@echo off
setlocal

echo === Downloading official Ultimate ASI Loader x64 dinput8.dll directly from GitHub releases ===

set TARGET_DIR=%~1
if "%TARGET_DIR%"=="" set TARGET_DIR=.\x64\Release\

set ZIP_URL=https://github.com/ThirteenAG/Ultimate-ASI-Loader/releases/download/x64-latest/dinput8-x64.zip
set ZIP_FILE=Ultimate-ASI-Loader-x64.zip
set DLL_NAME=dinput8.dll

REM Download only if we don't already have a fresh copy (caches between builds)
if not exist "%DLL_NAME%" (
  echo Downloading latest dinput8.dll from GitHub...
  powershell -Command "Invoke-WebRequest -Uri '%ZIP_URL%' -OutFile '%ZIP_FILE%' -UseBasicParsing"
  if errorlevel 1 (
    echo ERROR: Download failed. Check your internet connection.
    exit /b 1
  )

  echo Extracting dinput8.dll...
  powershell -Command "Expand-Archive -Path '%ZIP_FILE%' -DestinationPath . -Force"
  del "%ZIP_FILE%" >nul 2>&1
) else (
  echo Using cached dinput8.dll (delete it in the project folder to force redownload)
)

REM Copy to output folder so it's next to your .asi
copy /Y "%DLL_NAME%" "%TARGET_DIR%%DLL_NAME%" >nul
echo SUCCESS: dinput8.dll downloaded from GitHub releases and copied to output folder!

echo Pre-build completed.