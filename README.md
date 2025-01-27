# Dotfiles Repository for Windows Customization

![Build and Script Analyser](https://github.com/github/docs/actions/workflows/analyze_scripts.yml/badge.svg)


This repository simplifies the process of configuring and customizing your Windows environment by automating the installation of applications, fonts, tools, and other settings. 
<br>The modular approach ensures easy maintenance and scalability.

## Features

- **Setup Script**: Centralized `Setup.ps1` script to execute all configurations and installations.
- **Chocolatey Integration**: Automated installation of Chocolatey for package management.
- **Font Management**: Easy installation of custom fonts.
- **Application Installation**: Dynamically discovers folders containing application-specific install scripts.
- **Modular Design**: Functions are encapsulated in modules for better reusability and readability.
- **Validation Functions**: Ensures required applications, tools, and frameworks are already installed before proceeding.

## Repository Structure

```
root/
├── src/
│   ├── Modules/
│   │   ├── Helpers/
│   │   │   └── InstallAppUtilities.psm1
│   │   └── ValidationUtilities.psm1
│   ├── Chocolatey/
│   │   └── Chocolatey.ps1
│   ├── Fonts/
│   │   └── Fonts.ps1
│   └── AppName/
│       └── AppName.ps1
└── Setup.ps1
```

## Usage

1. Clone the repository to your local machine or download it:
   ```
   https://github.com/vcudalb/.dotfiles-win.git
   ```

2. Navigate to the cloned repository or downloaded content.
3. Execute the `Setup.ps1` script in PowerShell:
   ```powershell
   ./Setup.ps1
   ```

⚠️ WARNING: In case there are exceptions about the file lock <br> Before executing the command please adjust the path:

```powershell
Get-ChildItem -Path "C:\YourFolderPath" -Recurse -Include "*.ps1", "*.psm1", "*.psm" | ForEach-Object {
    Unblock-File -Path $_.FullName -WhatIf
}
```

## How It Works

- The `Setup.ps1` script orchestrates the installation process by invoking functions from modules.
- Each application, font, or tool has its own dedicated folder and installation script.
- Validation functions ensure prerequisites are installed to avoid redundant installations or errors.

## Contributions

Contributions are welcome! Please fork the repository, make your changes, and submit a pull request.

## License

This project is licensed under the MIT License. See the LICENSE file for details.

