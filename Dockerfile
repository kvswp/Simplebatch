FROM mcr.microsoft.com/windows/servercore:ltsc2022

# Download Visual Studio Build Tools 2022
ADD https://aka.ms/vs/17/release/vs_buildtools.exe C:\TEMP\vs_buildtools.exe

# Download Windows SDK
ADD https://go.microsoft.com/fwlink/p/?LinkID=2033056 C:\TEMP\winsdksetup.exe

# Install Visual Studio Build Tools and Windows SDK
RUN C:\TEMP\vs_buildtools.exe --quiet --wait --norestart --nocache --installPath C:\BuildTools --add Microsoft.VisualStudio.Workload.MSBuildTools --add Microsoft.VisualStudio.Workload.VCTools --add Microsoft.VisualStudio.Component.Windows10SDK.19041

RUN C:\TEMP\winsdksetup.exe /q /norestart

# Cleanup
RUN del C:\TEMP\vs_buildtools.exe && del C:\TEMP\winsdksetup.exe

# Set working directory
WORKDIR C:\src

# Start PowerShell
CMD ["powershell"]




