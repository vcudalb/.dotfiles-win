# Dotfiles Repository for Windows Customization

![Build and Script Analyser](https://github.com/vcudalb/.dotfiles-win/actions/workflows/analyze_scripts.yml/badge.svg)


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

## Supported Applications

The repository supports the installation and configuration of the following applications:

| Application           | Description                                     | Notes                             |
|-----------------------|-------------------------------------------------|-----------------------------------|
| **Chocolatey**        | Package manager for Windows                     | Ensures dependency management     |
| **Discord**           | Voice, video, and text communication platform   | For team collaboration or gaming  |
| **Docker**            | Containerized application platform              | Includes Docker Desktop           |
| **Dotnet frameworks** | Frameworks for building .NET applications       | Supports multiple versions        |
| **Fonts**             | Custom fonts for better UI/UX                   | Installs developer-friendly fonts |
| **Notepad++**         | Free source code editor and Notepad replacement | Lightweight and fast              |
| **OhMyPosh**          | Customizable prompt engine for PowerShell       | Enhances terminal aesthetics      |
| **Postman**           | API testing and collaboration tool              | Useful for developers             |
| **Rider**             | Cross-platform IDE for .NET development         | Requires JetBrains license        |
| **Skype**             | Communication tool for video and messaging      | Optional installation             |
| **Slack**             | Messaging platform for teams                    | Keeps your teams connected        |
| **Spotify**           | Digital music service                           | For entertainment purposes        |
| **Telegram**          | Messaging app with focus on speed and security  | Useful for teams and personal use |


## Usage

1. Clone the repository to your local machine or download it:
   ```
   https://github.com/vcudalb/.dotfiles-win.git
   ```

2. Navigate to root folder `dotfiles-win.git` of the cloned repository or downloaded content.
3. Execute the `Setup.ps1` script in PowerShell:
   ```powershell
   ./Setup.ps1
   ```

> [!CAUTION]  
> In case there are exceptions about the file lock please execute the command bellow.

> [!WARNING]  
> Before executing the command please navigate to the root directory `dotfiles-win.git`

```powershell
dir -r | unblock-file
```

## How It Works

- The `Setup.ps1` script orchestrates the installation process by invoking functions from modules.
- Each application, font, or tool has its own dedicated folder and installation script.
- Validation functions ensure prerequisites are installed to avoid redundant installations or errors.

## Contributions

Contributions are welcome! Please fork the repository, make your changes, and submit a pull request.

## License

This project is licensed under the MIT License. See the LICENSE file for details.

