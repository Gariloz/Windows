@echo off
chcp 65001 >nul

rem Запуск скрипта 0
echo Запуск скрипта 0. CurrentDir.cmd
call "CurrentDir.cmd" && echo [УСПЕХ] Скрипт 0 выполнен. || echo [ОШИБКА] Скрипт 0 завалился!
pause

rem Запуск скрипта 1
echo. & echo Запуск скрипта 1. Temp.cmd
call "1. Temp.cmd" && echo [УСПЕХ] Скрипт 1 выполнен. || echo [ОШИБКА] Скрипт 1 завалился!
pause

rem Запуск скрипта 2
echo. & echo Запуск скрипта 2. Keyboard.cmd
call "2. Keyboard.cmd" && echo [УСПЕХ] Скрипт 2 выполнен. || echo [ОШИБКА] Скрипт 2 завалился!
pause

rem Запуск скрипта 3
echo. & echo Запуск скрипта 3. Rebind Key.cmd
call "3. Rebind Key.cmd" && echo [УСПЕХ] Скрипт 3 выполнен. || echo [ОШИБКА] Скрипт 3 завалился!
pause

rem Запуск скрипта 4
echo. & echo Запуск скрипта 4. Swap File And Window Animation.cmd
call "4. Swap File And Window Animation.cmd" && echo [УСПЕХ] Скрипт 4 выполнен. || echo [ОШИБКА] Скрипт 4 завалился!
pause

rem Запуск скрипта 5
echo. & echo Запуск скрипта 5. Power CFG.cmd
call "5. Power CFG.cmd" && echo [УСПЕХ] Скрипт 5 выполнен. || echo [ОШИБКА] Скрипт 5 завалился!
pause

rem Запуск скрипта 6
echo. & echo Запуск скрипта 6. Services.cmd
call "6. Services.cmd" && echo [УСПЕХ] Скрипт 6 выполнен. || echo [ОШИБКА] Скрипт 6 завалился!
pause
