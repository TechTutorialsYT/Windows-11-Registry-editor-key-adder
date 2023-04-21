This script does the following:
Adds a key to "HKEY_LOCAL_MACHINE\SYSTEM\Setup\LabConfig"
Adds four DWORDs to it called "BypassSecureBootCheck" "BypassTPMCheck" "BypassRAMCheck" "BypassCPUCheck" 
Then adds another key: "HKEY_LOCAL_MACHINE\SYSTEM\Setup\MoSetup"
Adds a DWORD inside called: "AllowUpgradesWithUnsupportedTPMOrCPU"

All In all, This allows your PC/Laptop to bypass restrictions.
