@echo off

whoami /priv | find "SeDebugPrivilege" > nul
if %errorlevel% neq 0 (
    @powershell start-process "%~0" -verb runas
    exit

)

rem Temp_Delete
title Temp-Folder_Delete...
cd C:\Windows
del /q Temp

rem %Temp%_Delete
title %Temp%-Folder_Delete...
cd %Temp%
del /q %Temp%

rem Prefetch_Delete
title Prefetch-Folder_Delete...
cd C:\Windows
del /q Prefetch

rem InterNetCache_Delete
title InterNetCache-Folder_Delete...
del /q C:\Users\%username%\AppData\Local\Microsoft\Windows\INetCache\IE\*.*

rem DownloadProgramFiles_Delete
title DownloadProgramFiles-Folder_Delete...
del /q C:\Windows\Downloaded Program Files\*.*

rem RecycleBin_Delete
title RecycleBin_Delete...
rd /s /q %SYSTEMDRIVE%\$Recycle.bin

rem WindowsUpdate_Clear
title WindowsUpdateDownload-Folder_Delete...
cd C:\Windows
del /q SoftwareDistribution

rem Windows_Thumbnails_Cache
title ThumbnailsCache-Files_Delete...
cd C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows\Explorer
del /q thumbcache_*.db

rem Windows_Icon_Cache
title IconCache-Files_Delete...
cd C:\Users\%USERNAME%\AppData\Local\
del /a:h /q IconCache.db

rem Windows_Log_Delete
title Log-Files_Delete...
cd C:\
del /s *.log

rem Event_Log_Delete
title EventLog-Folder_Delete...
del /q C:\Windows\System32\winevt\Logs

rem Memory_DMP
title MemoryDMP-Files_Delete...
del /q C:\Windows\MEMORY.DMP

rem etl_delete
title ETL-Files_Delete...
del /q /s *.etl

rem dmp_delete
title DMP-Files_Delete...
del /q /s *.dmp

rem lkg_delete
title LKG-Files_Delete...
del /q /s *.lkg

rem vbm_delete
title VBM-Files_Delete...
del /q /s *.vbm

rem idx_delete
title IDX-Files_Delete...
del /q /s *.idx

rem pma_delete
title PMA-Files_Delete...
del /q /s *.pma

rem old_delete
title OLD-Files_Delete...
del /q /s *.old

rem Windows_Error
title WindowsErrorFiles-Folder-Delete...
del /q C:\ProgramData\Microsoft\Windows\WER\ReportQueue

rem SystemTemp_Delete
title SystemTemp-Folder_Delete...
cd C:\Windows
del /q SystemTemp

rem StartComponentCleanup
title StartComponentCleanup...
Dism.exe /online /Cleanup-Image /StartComponentCleanup

rem StartComponentCleanup_ResetBase
title StartComponentCleanup/ResetBase...
Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase

rem DNS_Cache_Clear
title DNSCache_Clear...
ipconfig /flushdns

rem MicrosoftStore_Cache_Clear
title MicrosoftStore_Reset...
wsreset.exe

rem MicrosoftStore_TaskKill
title MicrosoftStore_Taskkill...
taskkill /im WinStore.App.exe /f /t

rem Defrag
title Defrag...
defrag c: