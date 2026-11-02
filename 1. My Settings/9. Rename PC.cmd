chcp 65001

set "NewPCName=Amnesia"

if /i "%computername%" equ "%NewPCName%" (
    echo [ИНФО] Компьютер уже имеет имя "%NewPCName%".
) else (
    echo [ПРОЦЕСС] Изменение имени компьютера с "%computername%" на "%NewPCName%"...
    wmic computersystem where name="%computername%" call rename name="%NewPCName%"
    
    if %errorlevel% equ 0 (
        echo [УСПЕХ] Компьютер успешно переименован в "%NewPCName%".
    ) else (
        echo [ОШИБКА] Не удалось изменить имя компьютера.
    )
)