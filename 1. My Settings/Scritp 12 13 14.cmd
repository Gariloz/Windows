chcp 65001

rem Запуск скрипта 1
echo Запуск скрипта 1. Del Updates EXPERIMENTAL.cmd
call "12. Del Updates.cmd"
echo Скрипт 1: Del Updates.cmd выполнен.
pause

rem Запуск скрипта 2
echo Запуск скрипта 2. Del SystemApps EXPERIMENTAL.cmd
call "13. Del SystemApps EXPERIMENTAL.cmd"
echo Скрипт 2: Del SystemApps EXPERIMENTAL.cmd выполнен.
pause

rem Запуск скрипта 3
echo Запуск скрипта 3. Del Services EXPERIMENTAL.cmd
call "14. Del Services EXPERIMENTAL.cmd"
echo Скрипт 3: Del Services EXPERIMENTAL.cmd выполнен.
pause