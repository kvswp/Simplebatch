# Set the base image to the latest Windows Server Core
FROM mcr.microsoft.com/windows/servercore:ltsc2022

# Install Chocolatey package manager
RUN powershell -Command "Set-ExecutionPolicy Bypass -Scope Process -Force; `
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; `
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))"

# Install Visual Studio Build Tools and the Windows SDK
RUN choco install visualstudio2019buildtools -y --package-parameters "--add Microsoft.VisualStudio.Component.VC.ATLMFC --add Microsoft.VisualStudio.Component.Windows10SDK.19041" ; `
    choco install windows-sdk-10.0 -y

# Set the working directory
WORKDIR C:\app

# Set the command to be run when the container starts
CMD ["powershell.exe"]
