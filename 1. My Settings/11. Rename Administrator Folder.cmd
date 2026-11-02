chcp 65001

echo [ПРОЦЕСС] Переименование физической папки пользователя...

cd /d "C:\Users"

:: Если старая папка еще существует, пытаемся ее переименовать
if exist "Administrator" (
    ren "Administrator" "Amnesia"
)

:: Проверяем, удалось ли переименовать (появилась ли папка Amnesia)
if exist "Amnesia" (
    echo [УСПЕХ] Папка пользователя успешно переименована в "Amnesia".
    
    REM Отключаем безопасный режим
    bcdedit /deletevalue {default} safeboot >nul 2>&1
    
echo Нажмите любую клавишу для перезагрузки, или закройте cmd, чтобы отменить её.
    
    pause
    shutdown /r /t 0
) else (
    echo [ОШИБКА] Не удалось найти или переименовать папку в "Amnesia".
    pause
)
