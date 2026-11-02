@echo off
REM Завершение процессов и запрет их запуска
REM Terminate processes and prevent their launch
for %%P in (StartMenuExperienceHost.exe SearchApp.exe) do (
    taskkill /f /im "%%P"
    REM Проверяем, запустился ли процесс снова и повторяем попытку завершения
    :check_process_%%P
    tasklist | findstr /i "%%P"
    if !errorlevel! equ 0 (
        taskkill /f /im "%%P"
        goto check_process_%%P
    )
    reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\%%P" /v "Debugger" /t REG_SZ /d "taskkill /f /im %%P" /f
)

REM Получаем права на удаление папок
REM Take ownership of folders to allow deletion
takeown /F "C:\Windows\SystemApps" /A /R
icacls "C:\Windows\SystemApps" /grant administrators:F /T

REM Удаляем все папки в C:\Windows\SystemApps, кроме тех, что содержат ShellExperienceHost в названии
REM Delete all folders in C:\Windows\SystemApps except those containing ShellExperienceHost in the name
for /d %%D in ("C:\Windows\SystemApps\*") do (
    echo %%~nxD | findstr /i "ShellExperienceHost" >nul
    if errorlevel 1 (
        rmdir /S /Q "%%D"
    ) else (
        echo Preserving folder: %%D
    )
)

exit /b