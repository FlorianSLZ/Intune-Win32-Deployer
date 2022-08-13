﻿$PackageName = "WindowsPackageManager"
$MSIXBundle = "Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle"
$URL_msixbundle = "https://aka.ms/getwinget"

$Path_4Log = "$Env:Programfiles\_MEM"
Start-Transcript -Path "$Path_4Log\Log\$PackageName-install.log" -Force

# Program/Installation Folder
$Folder_install = "$Path_4Log\Data\$PackageName"
New-Item -Path $Folder_install -ItemType Directory -Force -Confirm:$false


# Download current WinGet MSIXBundle
Write-Host "Not installed. Downloading WinGet..." 
$wc = New-Object net.webclient
$wc.Downloadfile($URL_msixbundle, "$Folder_install\$MSIXBundle")

# Install WinGet MSIXBundle 
try{
    Add-AppxProvisionedPackage -Online -PackagePath "$Folder_install\$MSIXBundle" -SkipLicense 
    Write-Host "Installation of $PackageName finished"
}catch{
    Write-Error "Failed to install $PackageName!"
} 

# Install file cleanup
Start-Sleep 3 # to unblock installation file
Remove-Item -Path "$Folder_install" -Force -Recurse

Stop-Transcript
