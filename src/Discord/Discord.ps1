﻿Import-Module -Name (Join-Path -Path $PSScriptRoot -ChildPath "..\Modules\Helpers\AppCheckUtilities.psm1")

function Install {
    if (-not (Confirm-AppInstalled -AppName "Discord")) {
        choco install -y discord
    }
}

Export-ModuleMember -Function Install