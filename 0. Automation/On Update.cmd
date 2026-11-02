reg add HKLM\SYSTEM\CurrentControlSet\Services\wuauserv /v Start /t reg_dword /d 3 /f
net start wuauserv
pause