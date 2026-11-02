chcp 65001

echo [ПРОЦЕСС] Настройка сочетаний клавиш смены раскладки клавиатуры...

:: Настраиваем параметры для текущего пользователя
reg add "HKCU\Keyboard Layout\Toggle" /v "Language Hotkey" /t REG_SZ /d "2" /f
reg add "HKCU\Keyboard Layout\Toggle" /v "Hotkey" /t REG_SZ /d "2" /f
reg add "HKCU\Keyboard Layout\Toggle" /v "Layout Hotkey" /t REG_SZ /d "1" /f

:: Монтируем дефолтный профиль пользователя и настраиваем параметры там
reg load "HKLM\NTUSER" "%SystemDrive%\Users\Default\NTUSER.DAT"
reg add "HKLM\NTUSER\Keyboard Layout\Toggle" /v "Language Hotkey" /t REG_SZ /d "2" /f
reg add "HKLM\NTUSER\Keyboard Layout\Toggle" /v "Hotkey" /t REG_SZ /d "2" /f
reg add "HKLM\NTUSER\Keyboard Layout\Toggle" /v "Layout Hotkey" /t REG_SZ /d "1" /f
reg unload "HKLM\NTUSER"

if %errorlevel% equ 0 (
    echo [УСПЕХ] Горячие клавиши клавиатуры успешно настроены для всех профилей.
) else (
    echo [ОШИБКА] При изменении параметров клавиатуры возникли проблемы.
)