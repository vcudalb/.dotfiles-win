Import-Module -Name (Join-Path -Path $PSScriptRoot -ChildPath "..\Modules\Helpers\AppCheckUtilities.psm1")

function Install {
    if (-not (Confirm-AppInstalled -AppName "Skype")) {
        choco install -y skype
    }
}

Export-ModuleMember -Function Install