# Set the base image to the latest Windows Server Core
FROM mcr.microsoft.com/windows/servercore:ltsc2022

# Set the working directory
WORKDIR C:\app

# Install any required dependencies or packages
RUN Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force ; `
    Install-Module -Name SqlServer -RequiredVersion 21.1.18256 -Force

# Set the command to be run when the container starts
CMD ["powershell.exe"]
