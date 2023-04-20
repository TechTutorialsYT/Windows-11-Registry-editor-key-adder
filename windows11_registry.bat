@echo off
echo Warning: This script will modify the Windows Registry on your computer.
echo Press any key to continue, or press Ctrl+C to cancel.
pause > nul

set /p choice=Please type "Yes" to start adding keys, "No" to close the script, or "Revert" to delete the LabConfig key and its DWORDS: 
if /i "%choice%"=="Yes" goto add_keys
if /i "%choice%"=="No" goto close_script
if /i "%choice%"=="Revert" goto revert_keys
goto invalid_choice

:add_keys
echo Adding keys to the Windows Registry...
reg add "HKEY_LOCAL_MACHINE\SYSTEM\Setup\LabConfig" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\Setup\LabConfig" /v "BypassSecureBootCheck" /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\Setup\LabConfig" /v "BypassTPMCheck" /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\Setup\LabConfig" /v "BypassRAMCheck" /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\Setup\LabConfig" /v "BypassCPUCheck" /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\Setup\MoSetup" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\Setup\MoSetup" /v "AllowUpgradesWithUnsupportedTPMOrCPU" /t REG_DWORD /d 1 /f

echo Done!!1 Enjoj windosw 11!!1!
goto end

:revert_keys
echo Deleting LabConfig key and its DWORDS...
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\Setup\LabConfig" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\Setup\MoSetup" /v "AllowUpgradesWithUnsupportedTPMOrCPU" /f
echo LabConfig key and its DWORDS deleted successfully!
goto end

:close_script
echo Exiting script...
goto end

:invalid_choice
echo Invalid choice. Please try again.
goto add_keys

:end
