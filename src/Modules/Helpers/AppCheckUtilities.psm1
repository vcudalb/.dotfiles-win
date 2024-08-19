function Check-AppInstalled {
    param (
        [Parameter(Mandatory=$true)]
        [string]$AppName
    )
    $appRegistry = Get-ItemProperty "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*" `
                   -ErrorAction SilentlyContinue |
            Where-Object { $_.DisplayName -like "*$AppName*" }

    return $appRegistry -ne $null
}

function Check-DotNetInstalledVersion {
    param (
        [string]$Version
    )
    $installedVersions = dotnet --list-sdks | ForEach-Object { $_.Split(' ')[0] }
    return $installedVersions -contains $Version
}

Export-ModuleMember -Function Check-AppInstalled
Export-ModuleMember -Function Check-DotNetVersion