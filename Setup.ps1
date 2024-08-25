Import-Module -Name (Join-Path -Path $PSScriptRoot -ChildPath "\src\Modules\Helpers\InstallAppUtilities.psm1")

Write-Host "------------- Explore Dotfiles for Windows: Your Guide to Customization and Configuration -------------" -ForegroundColor Cyan;
Write-Host "------------- Kindly avoid using your device while the script is in progress -------------" -ForegroundColor Cyan;

Write-Host "Installing NuGet as package provider:" -ForegroundColor "Green";
Install-PackageProvider -Name "NuGet" -Force;

Write-Host "Setting up PSGallery as PowerShell trusted repository:" -ForegroundColor "Green";
Set-PSRepository -Name "PSGallery" -InstallationPolicy Trusted;

Write-Host "Updating PackageManagement module:" -ForegroundColor "Green";
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12;
Install-Module -Name "PackageManagement" -Force -MinimumVersion "1.4.6" -Scope "CurrentUser" -AllowClobber -Repository "PSGallery";

Install-Chocolatey
Install-Fonts
Install-Applications

Write-Progress -Activity "Setting up the Environment" -Status "Complete" -CurrentOperation "All scripts executed" -PercentComplete 100

Write-Host "The process has finished." -ForegroundColor "Yellow";

Write-Host "Restarting the PC in 10 seconds..." -ForegroundColor "Green";
Start-Sleep -Seconds 10;
#Restart-Computer;