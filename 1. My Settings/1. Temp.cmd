chcp 65001

echo [ПРОЦЕСС] Перенос папок TEMP и настройка прав доступа...

:: Создаем папку Temp в корне системного диска
md "%SystemDrive%\Temp"

:: Настраиваем права доступа для Администраторов (S-1-5-32-544) и Пользователей (S-1-5-32-545)
icacls "%SystemDrive%\Temp" /grant:r *S-1-5-32-544:(CI)(OI)F /inheritance:d /T /Q
icacls "%SystemDrive%\Temp" /grant:r *S-1-5-32-545:(CI)(OI)F /inheritance:d /T /Q

:: Меняем системные переменные окружения
reg add "HKLM\SYSTEM\ControlSet001\Control\Session Manager\Environment" /v "TEMP" /t REG_EXPAND_SZ /d "%%SystemDrive%%\Temp" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Session Manager\Environment" /v "TMP" /t REG_EXPAND_SZ /d "%%SystemDrive%%\Temp" /f

:: Меняем переменные текущего пользователя
reg add "HKCU\Environment" /v "TEMP" /t REG_EXPAND_SZ /d "%%SystemDrive%%\Temp" /f
reg add "HKCU\Environment" /v "TMP" /t REG_EXPAND_SZ /d "%%SystemDrive%%\Temp" /f

:: Монтируем дефолтный профиль пользователя и меняем переменные там
reg load "HKLM\NTUSER" "%SystemDrive%\Users\Default\NTUSER.DAT"
reg add "HKLM\NTUSER\Environment" /v "TEMP" /t REG_EXPAND_SZ /d "%%SystemDrive%%\Temp" /f
reg add "HKLM\NTUSER\Environment" /v "TMP" /t REG_EXPAND_SZ /d "%%SystemDrive%%\Temp" /f
reg unload "HKLM\NTUSER"

if %errorlevel% equ 0 (
    echo [УСПЕХ] Папки TEMP успешно перенесены, права доступа настроены.
) else (
    echo [ОШИБКА] При настройке путей TEMP возникли проблемы.
)
