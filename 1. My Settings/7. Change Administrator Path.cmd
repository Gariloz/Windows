chcp 65001

set "TargetFolderName=Amnesia"

for /f "tokens=2 delims==" %%A in ('wmic useraccount where name^="%USERNAME%" get sid /value 2^>nul') do set "UserSID=%%A"

if not defined UserSID (
    for /f "tokens=2 delims=\" %%A in ('whoami 2^>nul') do (
        for /f "tokens=2 delims==" %%B in ('wmic useraccount where name^="%%A" get sid /value 2^>nul') do set "UserSID=%%B"
    )
)

reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList\%UserSID%" /v ProfileImagePath /t REG_EXPAND_SZ /d "C:\Users\%TargetFolderName%" /f

if %errorlevel% equ 0 (
    echo [УСПЕХ] ProfileImagePath успешно изменен на C:\Users\%TargetFolderName%
) else (
    echo [ОШИБКА] Не удалось изменить ProfileImagePath в реестре.
)