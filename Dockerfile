FROM mcr.microsoft.com/windows/servercore:ltsc2022

WORKDIR "C:\workspace"

RUN curl -SL https://aka.ms/vs/17/release/vs_buildtools.exe -o vs_buildtools.exe

RUN curl -sl https://download.microsoft.com/download/4/2/2/422a5372-586f-4c2e-8d4d-1b28aa3c3e52/sdksetup.exe -o winsdksetup.exe

RUN dir

#RUN .\vs_buildtools.exe --quiet --wait --norestart --nocache --installPath C:\BuildTools

#RUN .\winsdksetup.exe /q /norestart

#RUN setx PATH "%PATH%;C:\BuildTools\MSBuild\Current\Bin"

CMD ["powershell"]




