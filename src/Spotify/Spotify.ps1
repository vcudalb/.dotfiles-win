Import-Module -Name (Join-Path -Path $PSScriptRoot -ChildPath "..\Modules\Helpers\AppCheckUtilities.psm1")

function Install {
    if (-not (Confirm-AppInstalled -AppName "Spotify")) {
        choco install -y spotify
    }
}

Export-ModuleMember -Function Install