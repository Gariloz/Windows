@echo off
chcp 65001 >nul

rem Запуск скрипта 0
echo Запуск скрипта 0. CurrentDir.cmd
call "CurrentDir.cmd" && echo [УСПЕХ] Скрипт 0 выполнен. || echo [ОШИБКА] Скрипт 0 завалился!
pause

rem Запуск скрипта 1
echo. & echo Запуск скрипта 1. Rename Administrator Folder.cmd
call "11. Rename Administrator Folder.cmd"
pause