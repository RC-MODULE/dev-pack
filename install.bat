@echo off
echo This will download and install dev-kit and xslt-processor to the current directory
echo WARNING: use --no-proxy option if are inside RC Module
choice /M "Do you have proxy server?"
if errorlevel 2 goto start 


set /p login="Enter login:"
set "psCommand=powershell -Command "$pword = read-host 'Enter Password' -AsSecureString ; ^
    $BSTR=[System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($pword); ^
        [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)""
for /f "usebackq delims=" %%p in (`%psCommand%`) do set password=%%p
set /p proxy="Enter proxy:port "
set http_proxy=http://%login%:%password%@%proxy%
set https_proxy=https://%login%:%password%@%proxy%

:start


make install NOPROXY=%1