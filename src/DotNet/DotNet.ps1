Import-Module -Name "$PSScriptRoot\AppCheckUtilities.psm1"

$dotnetVersions = @("6.0.100", "7.0.100", "8.0.100")

foreach ($version in $dotnetVersions) {
    if (Check-DotNetInstalledVersion -Version $version) {
        Write-Host ".NET SDK $version is already installed."
    } else {
        Write-Host "Installing .NET SDK $version..."
        choco install -y dotnet-sdk --version=$version
    }
}

refreshenv;

dotnet tool install --global dotnet-ef;