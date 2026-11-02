@echo off
chcp 65001 >nul

set "FoundPath="

:: Проверяем 1 уровень вверх
for /d %%A in ("%~dp0..") do (
    for /d %%B in ("%%~fA\1.*") do set "FoundPath=%%~fB"
)

:: Проверяем 2 уровня вверх
for /d %%A in ("%~dp0..\..") do (
    for /d %%B in ("%%~fA\1.*") do if not defined FoundPath set "FoundPath=%%~fB"
)

:: Проверяем 3 уровня вверх
for /d %%A in ("%~dp0..\..\..") do (
    for /d %%B in ("%%~fA\1.*") do if not defined FoundPath set "FoundPath=%%~fB"
)

:: Проверяем корень текущего диска
if not defined FoundPath (
    for /d %%B in ("%~d0\1.*") do set "FoundPath=%%~fB"
)

:: Проверяем результат поиска
if defined FoundPath (
    echo [УСПЕХ] Автоматически найдена папка: "%FoundPath%"
    
    :: Переходим в целевую папку (путь обязательно в кавычках)
    cd /d "%FoundPath%"
    if errorlevel 1 (
        echo [ОШИБКА] Не удалось перейти в папку "%FoundPath%".
    ) else (
        echo [УСПЕХ] Успешно перешли в рабочую папку.
    )
) else (
    echo [КРИТИЧЕСКАЯ ОШИБКА] Не удалось найти ни одной папки, начинающейся на "1." на уровнях выше.
    echo Текущая папка скрипта: "%~dp0"
)

exit /b
