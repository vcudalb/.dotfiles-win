Import-Module -Name (Join-Path -Path $PSScriptRoot -ChildPath "..\Modules\Helpers\AppCheckUtilities.psm1")

function Install {
    if (-not (Confirm-AppInstalled -AppName "Docker Desktop")) {
        choco install -y "docker-desktop" --execution-timeout 3600;
    }
}

Export-ModuleMember -Function Install