chcp 65001 >nul

echo [ПРОЦЕСС] Отключение безопасного режима...
bcdedit /deletevalue {default} safeboot >nul 2>&1

echo Нажмите любую клавишу для перезагрузки, или закройте cmd, чтобы отменить её.
@pause
shutdown -r -t 0