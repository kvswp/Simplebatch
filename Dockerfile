FROM mcr.microsoft.com/windows/servercore:ltsc2022

WORKDIR "C:\workspace"

RUN curl -SL https://aka.ms/vs/17/release/vs_buildtools.exe -o vs_buildtools.exe

RUN curl -sl https://download.microsoft.com/download/4/2/2/422a5372-586f-4c2e-8d4d-1b28aa3c3e52/sdksetup.exe -o winsdksetup.exe

RUN .\vs_buildtools.exe --quiet --wait --norestart --nocache --installPath C:\BuildTools --add Microsoft.VisualStudio.Workload.MSBuildTools --add Microsoft.VisualStudio.Workload.VCTools --add Microsoft.VisualStudio.Component.Windows10SDK.19041

RUN .\winsdksetup.exe /q /norestart

CMD ["powershell"]




