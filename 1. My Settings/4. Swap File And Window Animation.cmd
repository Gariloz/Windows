chcp 65001

echo [ПРОЦЕСС] Настройка файла подкачки и анимации окон...

:: Устанавливаем файл подкачки на диск C (20480 МБ = 20 ГБ)
set swapFileSizeMB=20480
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v PagingFiles /t REG_MULTI_SZ /d "C:\pagefile.sys %swapFileSizeMB% %swapFileSizeMB%" /f

:: Включаем отображение содержимого окна при перетаскивании
reg add "HKCU\Control Panel\Desktop" /v DragFullWindows /t REG_SZ /d 1 /f

if %errorlevel% equ 0 (
    echo [УСПЕХ] Файл подкачки %swapFileSizeMB% МБ и параметры окон успешно настроены.
) else (
    echo [ОШИБКА] Не удалось применить настройки памяти или интерфейса.
)