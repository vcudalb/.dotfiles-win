$dotnetVersions = @("6.0.100", "7.0.100", "8.0.100")

function Test-DotNetVersion {
    param (
        [string]$Version
    )
    $installedVersions = dotnet --list-sdks | ForEach-Object { $_.Split(' ')[0] }
    return $installedVersions -contains $Version
}

foreach ($version in $dotnetVersions) {
    if (Test-DotNetVersion -Version $version) {
        Write-Host ".NET SDK $version is already installed."
    } else {
        Write-Host "Installing .NET SDK $version..."
        choco install -y dotnet-sdk --version=$version
    }
}

refreshenv;

dotnet tool install --global dotnet-ef;