@echo off
chcp 65001 >nul
cd /d "%~dp0python"
echo Ingest books\ and memory\ into vector DB
echo Ensure memory_server.py is running on :8765
python ingest_books.py
pause
