chcp 65001

echo [ПРОЦЕСС] Переназначение клавиш клавиатуры (Scancode Map)...

:: Создаем ключ реестра с бинарной картой скан-кодов
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Keyboard Layout" /v "Scancode Map" /t REG_BINARY /d "0000000000000000030000001D00380038001D0000000000" /f

if %errorlevel% equ 0 (
    echo [УСПЕХ] Карта скан-кодов клавиатуры успешно записана в реестр.
) else (
    echo [ОШИБКА] Не удалось применить переназначение клавиш.
)