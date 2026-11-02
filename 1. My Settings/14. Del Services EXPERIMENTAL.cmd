@echo off
call :RusLocale
openfiles > nul 2>&1
if not %errorlevel% equ 0 goto NotAdmin
goto Continue

:NotAdmin
echo.%NOTADMIN1%
echo.%NOTADMIN2%
goto End

:Continue
call :RemoveService AarSvc
call :RemoveService AarSvc_4000c
call :RemoveService BcastDVRUserService
call :RemoveService BcastDVRUserService_4000c
call :RemoveService BluetoothUserService
call :RemoveService BluetoothUserService_4000c
call :RemoveService CaptureService
call :RemoveService CaptureService_4000c
call :RemoveService cbdhsvc
call :RemoveService cbdhsvc_4000c
call :RemoveService CDPUserSvc
call :RemoveService CDPUserSvc_4000c
call :RemoveService ConsentUxUserSvc
call :RemoveService ConsentUxUserSvc_4000c
call :RemoveService CredentialEnrollmentManagerUserSvc
call :RemoveService CredentialEnrollmentManagerUserSvc_4000c
call :RemoveService DeviceAssociationBrokerSvc
call :RemoveService DeviceAssociationBrokerSvc_4000c
call :RemoveService DevicePickerUserSvc
call :RemoveService DevicePickerUserSvc_4000c
call :RemoveService DevicesFlowUserSvc
call :RemoveService DevicesFlowUserSvc_4000c
call :RemoveService MessagingService
call :RemoveService MessagingService_4000c
call :RemoveService OneSyncSvc
call :RemoveService OneSyncSvc_4000c
call :RemoveService PimIndexMaintenanceSvc
call :RemoveService PimIndexMaintenanceSvc_4000c
call :RemoveService PrintWorkflowUserSvc
call :RemoveService PrintWorkflowUserSvc_4000c
call :RemoveService UdkUserSvc
call :RemoveService UdkUserSvc_4000c
call :RemoveService UnistoreSvc
call :RemoveService UnistoreSvc_4000c
call :RemoveService UserDataSvc
call :RemoveService UserDataSvc_4000c
call :RemoveService WpnUserService_4000c
call :RemoveService DiagTrack
call :RemoveService DiagTrack_4000c
call :RemoveService dmwappushservice
call :RemoveService dmwappushservice_4000c
call :RemoveService WerSvc
call :RemoveService WerSvc_4000c
call :RemoveService OneSyncSvc
call :RemoveService OneSyncSvc_4000c
call :RemoveService PimIndexMaintenanceSvc
call :RemoveService PimIndexMaintenanceSvc_4000c
call :RemoveService UnistoreSvc
call :RemoveService UnistoreSvc_4000c
call :RemoveService UserDataSvc
call :RemoveService UserDataSvc_4000c
call :RemoveService MessagingService
call :RemoveService MessagingService_4000c
call :RemoveService WpnUserService_4000c
call :RemoveService DevicesFlowUserSvc
call :RemoveService DevicesFlowUserSvc_4000c
call :RemoveService CDPUserSvc
call :RemoveService CDPUserSvc_4000c
:End
@pause > nul
exit

:RemoveService
echo.=== %1 ===
echo.%ATTEMPTTODELETE% %SERVICE% %1
for /f "tokens=1,4" %%x in ('sc query %1') do ( 
	if "%%x"=="STATE" ( 
		if "%%y"=="RUNNING" (
			echo.%SERVICE% %1 %RUNNING%
		) 
		if "%%y"=="STOPPED" (
			echo.%SERVICE% %1 %STOPPED%
		)
		call :DeleteService %1
	) else (
		if "%%x"=="‘®бв®п­ЁҐ" ( 
			if "%%y"=="RUNNING" (
				echo.%SERVICE% %1 %RUNNING%
			)
			if "%%y"=="STOPPED" (
				echo.%SERVICE% %1 %STOPPED%
			)
			call :DeleteService %1
		)
	)
	if "%%x"=="[SC]" ( 
		if "%%y"=="1060:" (
			echo.%SERVICE% %1 %NOT% %PROCESSED% [%ABSENT%]
		)
		if "%%y"=="5:" (
			echo.%SERVICE% %1 %NOT% %PROCESSED% [%ABORT%]
		)
	) 
)
echo.---------------------------------
echo.
exit /b

:DeleteService
for /f "tokens=*" %%I in ('reg query "HKLM\SYSTEM\ControlSet001\Services" /k /f "%1" ^| find /i "%1"') do (
	set /a found+=1
	set str=%%I
	if "%str%" equ "" (
		sc delete %1 > nul
		echo.%BLOCKED% %1 %INREGISTRY%
		reg add "%%I" /v "Start" /t REG_DWORD /d 4 /f
	) else (
		for /f "usebackq delims=\ tokens=5*" %%a in (`echo %%I`) do (
			sc delete %%a > nul
			echo.%BLOCKED% %%a %INREGISTRY%
			reg add "%%I" /v "Start" /t REG_DWORD /d 4 /f
		)
	)
)
echo.%SERVICE% %1 %PROCESSED%...
exit /b

:RusLocale
chcp 1251 > nul
	set NOTADMIN1=НЕТ ПРАВ АДМИНИСТРАТОРА!!!
	set NOTADMIN2=Нажми правую кнопку мышки и выбери "Запуск от имени администратора"
	set RUNNING=ВЫПОЛНЯЕТСЯ
	set STOPPED=ОСТАНОВЛЕН
	set ABSENT=ОТСУТСТВУЕТ
	set ABORT=ОТКАЗАНО В ДОСТУПЕ
	set SERVICE=СЕРВИС
	set PROCESSED=ОБРАБОТАН
	set NOT=НЕ
	set ATTEMPTTODELETE=ПОПЫТКА УДАЛИТЬ
	set BLOCKED=БЛОКИРУЕМ ЗАПУСК СЕРВИСА
	set INREGISTRY=В РЕЕСТРЕ
	set NOTADMIN1=NO ADMIN RIGHTS!!!
	set NOTADMIN2=Right-click and select "Run as administrator"
	set RUNNING=RUNNING
	set STOPPED=STOPPED
	set ABSENT=ABSENT
	set ABORT=ACCESS DENIED
	set SERVICE=SERVICE
	set PROCESSED=PROCESSED
	set NOT=NOT
	set ATTEMPTTODELETE=ATTEMPT TO DELETE
	set BLOCKED=BLOCKING SERVICE START
	set INREGISTRY=IN REGISTRY
chcp 866 > nul
exit /b