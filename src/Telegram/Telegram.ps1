﻿Import-Module -Name (Join-Path -Path $PSScriptRoot -ChildPath "..\Modules\Helpers\AppCheckUtilities.psm1")

function Install {
    if (-not (Confirm-AppInstalled -AppName "Telegram")) {
        choco install -y telegram
    }
}

Export-ModuleMember -Function Install