@echo off
chcp 65001 >nul
title GGUF Runner — First Run
cd /d "%~dp0"
echo ========================================================
echo  GGUF Runner — Offline-first First Run
echo  Team: Mehdi Tariri ^| Mohsen Tarifii
echo ========================================================
echo.

if exist "python\python.exe" (
  echo [OK] Bundled Python found — offline mode ready
  "python\python.exe" -c "import sys; print(sys.version)"
  "python\python.exe" -c "import llama_cpp; print('[OK] llama_cpp')" 2>nul || echo [WARN] llama_cpp missing — optional: run SETUP with internet
  "python\python.exe" -c "import customtkinter; print('[OK] customtkinter')" 2>nul || echo [WARN] customtkinter missing
) else (
  echo [!] Bundled Python not found — running SETUP (needs internet once^)
  call "%~dp0SETUP.bat" /silent
)

echo.
echo Put .gguf models in: %~dp0models\
if not exist "models\*.gguf" (
  echo [!] No models yet — opening models folder
  if not exist models mkdir models
  explorer "%~dp0models"
  pause
)

echo Starting chat...
call "%~dp0CHAT.bat"
