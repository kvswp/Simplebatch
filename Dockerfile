# Set the base image to the latest Windows Server Core
FROM mcr.microsoft.com/windows/servercore:ltsc2022

# Set the working directory
WORKDIR C:\app

# Copy the application files to the container
COPY app\ .

# Install any required dependencies or packages
RUN Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force ; `
    Install-Module -Name SqlServer -RequiredVersion 21.1.18256 -Force

# Expose any necessary ports
EXPOSE 80

# Set the command to be run when the container starts
CMD ["cmd", "/c", "start-process -FilePath .\app.exe -Wait"]
