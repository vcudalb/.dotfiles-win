Import-Module -Name (Join-Path -Path $PSScriptRoot -ChildPath "..\Modules\Helpers\AppCheckUtilities.psm1")

$dotnetVersions = @("8.0.100")

foreach ($version in $dotnetVersions) {
    if (-not (Confirm-DotNetVersionInstalled -Version $version)) {
        choco install -y dotnet-sdk --version=$version
    }
}

refreshenv;

if (-not (Confirm-DotNetToolInstalled -Version $version)) {
    dotnet tool install --global dotnet-ef;
}

