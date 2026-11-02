chcp 65001

set "NewAdminName=Amnesia"

for /f "tokens=2 delims=\" %%A in ('whoami 2^>nul') do set "CurrentAdminName=%%A"

if not defined CurrentAdminName set "CurrentAdminName=%USERNAME%"

if /i "%CurrentAdminName%" equ "%NewAdminName%" (
    echo [ИНФО] Учетная запись администратора уже имеет имя "%NewAdminName%".
) else (
    echo [ПРОЦЕСС] Переименование встроенного администратора из "%CurrentAdminName%" в "%NewAdminName%"...
    wmic useraccount where name="%CurrentAdminName%" rename "%NewAdminName%"
    
    if %errorlevel% equ 0 (
        echo [УСПЕХ] Учетная запись успешно переименована в "%NewAdminName%".
    ) else (
        net user "%CurrentAdminName%" "%NewAdminName%"
        if %errorlevel% equ 0 (
            echo [УСПЕХ] Учетная запись успешно переименована через net user в "%NewAdminName%".
        ) else (
            echo [ОШИБКА] Не удалось переименовать учетную запись.
        )
    )
)