# Set the base image to the latest Windows Server Core
FROM mcr.microsoft.com/windows/servercore:ltsc2022

# Set the working directory
WORKDIR "C:\app"

# Set the command to be run when the container starts
ENTRYPOINT ["powershell.exe"]
