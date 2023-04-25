# Set the base image to the latest Windows Server Core
FROM mcr.microsoft.com/windows/servercore:ltsc2022

# Set up Chocolatey package manager
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

RUN [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; `
    Invoke-WebRequest -Uri https://chocolatey.org/install.ps1 -UseBasicParsing | Invoke-Expression

# Install Visual Studio Build Tools and the Windows SDK
RUN choco install visualstudio2019buildtools -y --package-parameters "--add Microsoft.VisualStudio.Component.VC.ATLMFC --add Microsoft.VisualStudio.Component.Windows10SDK.19041" ; `
    choco install windows-sdk-10.0 -y

# Set the working directory
WORKDIR C:\app

# Set the command to be run when the container starts
CMD ["powershell.exe"]
