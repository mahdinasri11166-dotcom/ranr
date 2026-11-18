@echo off
chcp 65001 >nul
title GGUF Desktop Chat v2.0
cd /d "%~dp0"
echo GGUF Desktop Chat v2.0
echo Mehdi Tariri / Mohsen Tarifii - mahditariri@gmail.com | Mohsen Tarifii Masean.us@gmail.com
echo.

if not exist "models" mkdir models 2>nul
if not exist "sessions" mkdir sessions 2>nul
if not exist "workspace" mkdir workspace 2>nul

set "PY="
if exist "python\python.exe" set "PY=%~dp0python\python.exe"
if not defined PY (
  where python >nul 2>&1 && set "PY=python"
)
if not defined PY (
  echo [ERROR] Python not found. Run SETUP.bat first.
  pause
  exit /b 1
)

echo Using: %PY%
"%PY%" -c "import llama_cpp" 2>nul
if errorlevel 1 (
  echo [WARN] llama-cpp-python missing — installing...
  "%PY%" -m pip install llama-cpp-python customtkinter
)

echo Starting UI...
"%PY%" "%~dp0scripts\python\desktop_chat.py"
set ERR=%ERRORLEVEL%
if not "%ERR%"=="0" (
  echo.
  echo Chat exited with code %ERR%
  echo Tips: SETUP.bat ^| scripts\doctor.bat ^| put .gguf in models\
  pause
)
exit /b %ERR%
