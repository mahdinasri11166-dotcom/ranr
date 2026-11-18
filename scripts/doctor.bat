@echo off
chcp 65001 >nul
title GGUF Doctor
cd /d "%~dp0.."
echo ========================================================
echo  GGUF Runner Doctor v1.9
echo  Mehdi Tariri
echo ========================================================
echo Root: %CD%
echo.

if exist "python\python.exe" (
  echo [OK] embedded python
  "python\python.exe" -c "import sys; print('  ', sys.version)"
) else (
  echo [!] no embedded python — run SETUP.bat
)

if exist "python\python.exe" (
  "python\python.exe" -c "import llama_cpp; print('[OK] llama_cpp')" 2>nul || echo [!] llama-cpp-python missing
  "python\python.exe" -c "import customtkinter; print('[OK] customtkinter')" 2>nul || echo [!] customtkinter missing
) else (
  python -c "import llama_cpp; print('[OK] llama_cpp')" 2>nul || echo [!] llama-cpp-python missing
)

set /a mc=0
for %%f in ("models\*.gguf") do set /a mc+=1
echo [i] models: %mc% GGUF file(s)

if exist "scripts\python\desktop_chat.py" (echo [OK] desktop_chat.py) else (echo [!] desktop_chat.py missing)
if exist "scripts\python\agent_tools.py" (echo [OK] agent_tools.py) else (echo [!] agent_tools.py missing)
if exist "CHAT.bat" (echo [OK] CHAT.bat) else (echo [!] CHAT.bat missing)

echo.
echo Running selftest if present...
if exist "scripts\python\selftest.py" (
  call scripts\run_py.bat scripts\python\selftest.py
) else (
  echo [i] no selftest.py
)
echo.
pause
