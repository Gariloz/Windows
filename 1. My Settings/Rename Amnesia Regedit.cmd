:: Получение SID учетной записи amnesia
for /f "tokens=2 delims==" %%A in ('wmic useraccount where name^="Amnesia" get sid /value') do set AdminSID=%%A

:: Изменение значения ProfileImagePath
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList\%AdminSID%" /v ProfileImagePath /t REG_EXPAND_SZ /d "C:\Users\Amnesia" /f

echo ProfileImagePath успешно изменен на C:\Users\Amnesia
exit /b
