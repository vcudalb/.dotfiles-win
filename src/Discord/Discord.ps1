function Test-DiscordInstalled {
    $discordPath = Get-ItemProperty "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*" |
            Where-Object { $_.DisplayName -like "*Discord*" } |
            Select-Object -First 1 -ExpandProperty InstallLocation
    return $discordPath -ne $null
}

if (Test-DiscordInstalled) {
    Write-Host "Discord is already installed."
} else {
    Write-Host "Installing Discord..."
    choco install -y discord
}

refreshenv;