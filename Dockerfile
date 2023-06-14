# escape=`

FROM mcr.microsoft.com/powershell:windowsservercore-1909 AS downloadnodejs
ENV NODE_VERSION=14.16.0
SHELL ["pwsh", "-Command", "$ErrorActionPreference = 'Stop';$ProgressPreference='silentlyContinue';"]
RUN Invoke-WebRequest -OutFile nodejs.zip -UseBasicParsing "https://nodejs.org/dist/v$($env:NODE_VERSION)/node-v$($env:NODE_VERSION)-win-x64.zip";
RUN Expand-Archive nodejs.zip -DestinationPath C:\;
RUN Rename-Item "C:\node-v$($env:NODE_VERSION)-win-x64" c:\nodejs