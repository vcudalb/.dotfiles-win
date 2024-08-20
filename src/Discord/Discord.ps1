﻿Import-Module -Name (Join-Path -Path $PSScriptRoot -ChildPath "..\Modules\Helpers\AppCheckUtilities.psm1")

if (-not (Confirm-AppInstalled -AppName "Discord")) {
    choco install -y discord
}