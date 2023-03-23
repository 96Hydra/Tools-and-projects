# PS script that checks for compliance for Windows Devices

$WMI_ComputerSystem = Get-WMIObject -class Win32_ComputerSystem
$WMI_BIOS = Get-WMIObject -class Win32_BIOS 
$TPM = Get-Tpm

$hash = @{ ModelName = $WMI_ComputerSystem.Model; BiosVersion = $WMI_BIOS.SMBIOSBIOSVersion; TPMChipPresent = $TPM.TPMPresent}
return $hash | ConvertTo-Json -Compress


#Example Output
// PS C:\Users\User\Document> .\Device_Compliance.ps1
// {"ModelName":  "Dell","BiosVersion":  1.24,"TPMChipPresent":  true}