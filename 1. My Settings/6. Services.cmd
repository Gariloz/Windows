chcp 65001

echo [ПРОЦЕСС] Остановка и отключение служб...

REM Delivery Optimization (Оптимизация доставки)
net stop DoSvc
reg add HKLM\SYSTEM\CurrentControlSet\Services\DoSvc /v Start /t reg_dword /d 4 /f

REM Windows Update (Центр обновления Windows)
net stop wuauserv
reg add HKLM\SYSTEM\CurrentControlSet\Services\wuauserv /v Start /t reg_dword /d 4 /f

REM Windows Update Medic Service (Служба Medic центра обновления Windows)
net stop WaaSMedicSvc
reg add HKLM\SYSTEM\CurrentControlSet\Services\WaaSMedicSvc /v Start /t reg_dword /d 4 /f

REM Windows Search (Windows Search)
net stop WSearch
reg add HKLM\SYSTEM\CurrentControlSet\Services\WSearch /v Start /t reg_dword /d 4 /f

REM Touch Keyboard and Handwriting Panel Service (Служба сенсорной клавиатуры и панели рукописного ввода)
net stop TabletInputService
reg add HKLM\SYSTEM\CurrentControlSet\Services\TabletInputService /v Start /t reg_dword /d 4 /f

REM Volume Shadow Copy (Теневое копирование тома)
net stop VSS
reg add HKLM\SYSTEM\CurrentControlSet\Services\VSS /v Start /t reg_dword /d 4 /f

if %errorlevel% equ 0 (
    echo [УСПЕХ] Все указанные службы успешно остановлены и отключены.
) else (
    echo [ОШИБКА] При отключении служб возникли проблемы.
)