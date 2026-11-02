net stop wuauserv
reg add HKLM\SYSTEM\CurrentControlSet\Services\wuauserv /v Start /t reg_dword /d 4 /f
pause