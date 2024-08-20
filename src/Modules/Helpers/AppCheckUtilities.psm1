function Confirm-AppInstalled {
    param (
        [Parameter(Mandatory=$true)]
        [string]$AppName
    )

    $paths = @(
        "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*",
        "HKLM:\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*",
        "HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*"
    )

    foreach ($path in $paths) {
        $appRegistry = Get-ItemProperty $path -ErrorAction SilentlyContinue |
                Where-Object { $_.DisplayName -like "*$AppName*" }

        if ($appRegistry) {
            return $true
        }
    }

    return $false
}

function Confirm-DotNetVersionInstalled {
    param (
        [string]$Version
    )
    
    $mainVersion = $Version.Split('.')[0]
    $installedVersions = dotnet --list-sdks | ForEach-Object { $_.Split(' ')[0] }
    $isInstalled = $installedVersions | Where-Object { $_.StartsWith("$mainVersion.") }
    return $isInstalled.Count -gt 0
}

function Confirm-DotNetToolInstalled {
    param (
        [string]$ToolName
    )

    try {
        dotnet $ToolName --version | Out-Null
        return $true
    } catch {
        return $false
    }
}


Export-ModuleMember -Function Confirm-AppInstalled
Export-ModuleMember -Function Confirm-DotNetVersionInstalled
Export-ModuleMember -Function Confirm-DotNetToolInstalled