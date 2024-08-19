Import-Module -Name "$PSScriptRoot\AppCheckUtilities.psm1"

if (Check-AppInstalled -AppName "Docker Desktop") {
    Write-Host "Docker Desktop is already installed."
} else {
    Write-Host "Installing Docker Desktop"
    choco install -y "docker-desktop" --execution-timeout 3600;
}
