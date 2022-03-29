# Array of the PowerShell Modules
$PSModules = "IntuneWin32App", "Microsoft.Graph.Intune"

Write-Host "Installing required PS Modules" -ForegroundColor Cyan
# ExecutionPolicy and NuGet
Set-ExecutionPolicy Unrestricted -Force
Install-PackageProvider -Name NuGet -Force

# Install all defined Modules
foreach($Module in $PSModules){
    Write-Host $Module
    Install-Module -Name $Module -Force
}


# Calling PS Script
Write-Host "Calling deploy-win32-fully-automated.ps1" -ForegroundColor Cyan
C:\Users\WDAGUtilityAccount\Desktop\deploy-win32-fully-automated\deploy-win32-fully-automated.ps1
