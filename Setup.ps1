$scripts = @(
    @{ Name = "Chocolatey"; Path = "src\Chocolatey\Chocolatey.ps1" },
    @{ Name = "Discord"; Path = "src\Discord\Discord.ps1" },
    @{ Name = "Docker"; Path = "src\Docker\Docker.ps1" },
    @{ Name = "DotNet"; Path = "src\DotNet\DotNet.ps1" }
)

Write-Host "------------- Explore Dotfiles for Windows: Your Guide to Customization and Configuration -------------" -ForegroundColor Cyan;
Write-Host "------------- Kindly avoid using your device while the script is in progress -------------" -ForegroundColor Cyan;

$totalScripts = $scripts.Count

for ($i = 0; $i -lt $totalScripts; $i++) {
    $script = $scripts[$i]
    $scriptName = $script.Name
    $scriptPath = Join-Path -Path $PSScriptRoot -ChildPath $script.Path
    $percentageCompleted = (($i + 1) / $totalScripts * 100)
    
    Write-Progress -Activity "Setting up the Environment" -Status "In Progress" -CurrentOperation "Running $scriptName" -PercentComplete $percentageCompleted

    try {
        Invoke-Expression $scriptPath
    } catch {
        Write-Error "Failed to execute $scriptName. Error: $_"
    }
}

Write-Progress -Activity "Setting up the Environment" -Status "Complete" -CurrentOperation "All scripts executed" -PercentComplete 100

Write-Host "The process has finished." -ForegroundColor "Yellow";

Write-Host "Restarting the PC in 10 seconds..." -ForegroundColor "Green";
Start-Sleep -Seconds 10;
#Restart-Computer;