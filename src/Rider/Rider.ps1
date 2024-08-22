Import-Module -Name (Join-Path -Path $PSScriptRoot -ChildPath "..\Modules\Helpers\AppCheckUtilities.psm1")

function Install {
    if (-not (Confirm-AppInstalled -AppName "Rider")) {
        choco install -y rider
    }
}

Export-ModuleMember -Function Install