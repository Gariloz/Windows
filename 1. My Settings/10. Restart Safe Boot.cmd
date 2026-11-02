chcp 65001

echo [ПРОЦЕСС] Включение безопасного режима...
bcdedit /set {default} safeboot minimal

echo Нажмите любую клавишу для перезагрузки, или закройте cmd что бы отменить ее.

@pause
shutdown -r -t 0