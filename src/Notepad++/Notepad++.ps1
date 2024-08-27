Import-Module -Name (Join-Path -Path $PSScriptRoot -ChildPath "..\Modules\Helpers\AppCheckUtilities.psm1")

function Set-NotepadPlusPlus-Configuration {
    $NotepadPlusPlusConfigurationPath = Join-Path -Path $env:appdata -ChildPath "Notepad++";
    $DotfilesNotepadPlusPlusConfigurationPath = $PSScriptRoot;

    if (-not (Test-Path -Path $NotepadPlusPlusConfigurationPath)) {
        Write-Host "Notepad++ is not installed or configured." -ForegroundColor Yellow;
    }
    else {
        Write-Host "Configuring Notepad++:" -ForegroundColor Cyan;

        Get-ChildItem -Path "${DotfilesNotepadPlusPlusConfigurationPath}\*" -Include *.xml -Recurse | Copy-Item -Destination $NotepadPlusPlusConfigurationPath -Force;

        Write-Host "Notepad++ was successfully configured." -ForegroundColor Green;
    }
}

function Install {
    if (-not (Confirm-AppInstalled -AppName "NotePad++")) {
        choco install -y "notepadplusplus";
    }
    
    Set-NotepadPlusPlus-Configuration;
}

Export-ModuleMember -Function Install