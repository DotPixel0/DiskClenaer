@echo off

whoami /priv | find "SeDebugPrivilege" > nul
if %errorlevel% neq 0 (
    @powershell start-process "%~0" -verb runas
    exit

)

rem Temp_Delete
cd C:\Windows
del /q Temp

rem %Temp%_Delete
cd %Temp%
del /q %Temp%

rem Prefetch_Delete
cd C:\Windows
del /q Prefetch

rem InterNetCache_Delete
del /q C:\Users\%username%\AppData\Local\Microsoft\Windows\INetCache\IE\*.*

rem DownloadProgramFiles_Delete
del /q C:\Windows\Downloaded Program Files\*.*

rem RecycleBin_Delete
rd /s /q %SYSTEMDRIVE%\$Recycle.bin

rem WindowsUpdate_Clear
cd C:\Windows
del /q SoftwareDistribution

rem Windows_Thumbnails_Cache
cd C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows\Explorer
del /q thumbcache_*.db

rem Windows_Icon_Cache
cd C:\Users\%USERNAME%\AppData\Local\
del /a:h /q IconCache.db

rem Windows_Log_Delete
cd C:\
del /s *.log

rem Event_Log_Delete
del /q C:\Windows\System32\winevt\Logs

rem Memory_DMP
del /q C:\Windows\MEMORY.DMP

rem etl_delete
del /q /s *.etl

rem dmp_delete
del /q /s *.dmp

rem lkg_delete
del /q /s *.lkg

rem vbm_delete
del /q /s *.vbm

rem idx_dellete
del /q /s *.idx

rem pma_dellete
del /q /s *.pma

rem old_delete
del /q /s *.old_delete

rem Windows_Error
del /q C:\ProgramData\Microsoft\Windows\WER\ReportQueue

rem SystemTemp_Delete
cd C:\Windows
del /q SystemTemp

rem StartComponentCleanup
Dism.exe /online /Cleanup-Image /StartComponentCleanup

rem StartComponentCleanup_ResetBase
Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase

rem DNS_Cache_Clear
ipconfig /flushdns

rem MicrosoftStore_Cache_Clear
wsreset.exe

rem MicrosoftStore_TaskKill
taskkill /im WinStore.App.exe /f /t

rem Defrag
defrag c: