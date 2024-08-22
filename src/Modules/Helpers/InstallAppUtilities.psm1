function Install-Chocolatey {
    $srcPath = Join-Path -Path $PSScriptRoot -ChildPath "..\..\"
    $chocolateyFolder = Get-ChildItem -Path $srcPath -Directory | Where-Object { $_.Name -eq "Chocolatey" }

    if ($chocolateyFolder) {
        $chocolateyScriptPath = Join-Path -Path $chocolateyFolder.FullName -ChildPath "$($chocolateyFolder.Name).ps1"

        if (Test-Path $chocolateyScriptPath) {
            try {
                . $chocolateyScriptPath
                Install
            } catch {
                Write-Error "Failed to install Chocolatey: $_"
            }
        } else {
            Write-Warning "Chocolatey install script not found: $chocolateyScriptPath"
        }
    }
}

function Install-Applications {
    $srcPath = Join-Path -Path $PSScriptRoot -ChildPath "..\..\"
    $folders = Get-ChildItem -Path $srcPath -Directory | Where-Object { $_.Name -ne "Modules" -and $_.Name -ne "Chocolatey" }
    
    for ($i = 0; $i -lt $folders.Count; $i++) {
        $folder = $folders[$i]
        $installScriptPath = Join-Path -Path $folder.FullName -ChildPath "$($folder.Name).ps1"
        $percentageCompleted = (($i + 1) / $folders.Count * 100)

        if (Test-Path $installScriptPath) {
            try {
                Write-Progress -Activity "Setting up the Environment" -Status "In Progress" -CurrentOperation "Running $folder.Name" -PercentComplete $percentageCompleted
                . $installScriptPath
                Install
            } catch {
                Write-Error "Failed to execute Install method in $($folder.Name): $_"
            }
        } else {
            Write-Warning "Install script not found: $installScriptPath"
        }
    }
}

Export-ModuleMember -Function Install-Chocolatey
Export-ModuleMember -Function Install-Applications