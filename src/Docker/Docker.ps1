Import-Module -Name (Join-Path -Path $PSScriptRoot -ChildPath "..\Modules\Helpers\AppCheckUtilities.psm1")

if (-not (Confirm-AppInstalled -AppName "Docker Desktop")) {
    choco install -y "docker-desktop" --execution-timeout 3600;
}