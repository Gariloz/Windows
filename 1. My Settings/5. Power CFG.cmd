chcp 65001

echo [ПРОЦЕСС] Настройка схемы электропитания...

:: Пытаемся активировать схему электропитания Game Turbo
powercfg -setactive ce9fa8b3-8e9e-42db-b4e1-e6297f6cdd7e

if %errorlevel% equ 0 (
    echo [УСПЕХ] Схема электропитания Game Turbo успешно активирована.
) else (
    echo [ОШИБКА] Указанная схема питания ce9fa8b3... не найдена в системе.
)